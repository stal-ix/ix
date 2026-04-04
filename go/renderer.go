package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"hash/fnv"
	"io"
	"os"
	"os/exec"
	"runtime"
	"strconv"
	"sync"
)

type RenderRequest struct {
	Name  string         `json:"name"`
	Flags map[string]any `json:"flags"`
}

type RenderResponse struct {
	Descr map[string]any `json:"descr,omitempty"`
	Boot  bool           `json:"boot,omitempty"`
	Error string         `json:"error,omitempty"`
}

type renderJob struct {
	name  string
	flags map[string]any
	resp  chan renderResult
}

type renderResult struct {
	resp *RenderResponse
	err  error
}

type worker struct {
	cmd    *exec.Cmd
	stdin  io.WriteCloser
	reader *bufio.Reader
	queue  chan renderJob
}

func startWorker(selfDir string) (*worker, map[string]any, error) {
	script := selfDir + "/render.py"
	cmd := exec.Command("python3", script)
	cmd.Dir = selfDir + "/.."
	cmd.Stderr = os.Stderr

	stdin, err := cmd.StdinPipe()
	if err != nil {
		return nil, nil, err
	}

	stdout, err := cmd.StdoutPipe()
	if err != nil {
		return nil, nil, err
	}

	if err := cmd.Start(); err != nil {
		return nil, nil, fmt.Errorf("start render.py: %w", err)
	}

	reader := bufio.NewReaderSize(stdout, 1<<20)

	line, err := reader.ReadBytes('\n')
	if err != nil {
		cmd.Process.Kill()
		return nil, nil, fmt.Errorf("read host config: %w", err)
	}

	var initResp struct {
		Host map[string]any `json:"host"`
	}
	if err := json.Unmarshal(line, &initResp); err != nil {
		cmd.Process.Kill()
		return nil, nil, fmt.Errorf("parse host config: %w", err)
	}

	w := &worker{
		cmd:    cmd,
		stdin:  stdin,
		reader: reader,
		queue:  make(chan renderJob, 64),
	}

	go w.loop()

	return w, initResp.Host, nil
}

func (w *worker) loop() {
	for job := range w.queue {
		resp, err := w.render(job.name, job.flags)
		job.resp <- renderResult{resp, err}
	}
}

func (w *worker) render(name string, flags map[string]any) (*RenderResponse, error) {
	data, err := json.Marshal(RenderRequest{Name: name, Flags: flags})
	if err != nil {
		return nil, err
	}

	data = append(data, '\n')
	if _, err := w.stdin.Write(data); err != nil {
		return nil, fmt.Errorf("write to render.py: %w", err)
	}

	line, err := w.reader.ReadBytes('\n')
	if err != nil {
		return nil, fmt.Errorf("read from render.py: %w", err)
	}

	var resp RenderResponse
	if err := json.Unmarshal(line, &resp); err != nil {
		return nil, fmt.Errorf("parse render response: %w", err)
	}

	if resp.Error != "" {
		return nil, fmt.Errorf("render %s: %s", name, resp.Error)
	}

	return &resp, nil
}

func (w *worker) close() error {
	close(w.queue)
	w.stdin.Close()
	return w.cmd.Wait()
}

// Renderer shards render requests by template path across N workers.
type Renderer struct {
	Host    map[string]any
	workers []*worker
	n       int
}

func numWorkers() int {
	if v := os.Getenv("IX_RENDER_JOBS"); v != "" {
		if n, err := strconv.Atoi(v); err == nil && n > 0 {
			return n
		}
	}
	n := runtime.NumCPU()
	if n > 8 {
		n = 8
	}
	return n
}

func NewRenderer(selfDir string) (*Renderer, error) {
	n := numWorkers()

	// Start first worker to get host config
	first, host, err := startWorker(selfDir)
	if err != nil {
		return nil, err
	}

	workers := make([]*worker, n)
	workers[0] = first

	// Start remaining workers in parallel
	var mu sync.Mutex
	var wg sync.WaitGroup
	var firstErr error

	wg.Add(n - 1)
	for i := 1; i < n; i++ {
		i := i
		go func() {
			defer wg.Done()
			w, _, err := startWorker(selfDir)
			mu.Lock()
			defer mu.Unlock()
			if err != nil {
				if firstErr == nil {
					firstErr = err
				}
				return
			}
			workers[i] = w
		}()
	}
	wg.Wait()

	if firstErr != nil {
		for _, w := range workers {
			if w != nil {
				w.close()
			}
		}
		return nil, firstErr
	}

	return &Renderer{Host: host, workers: workers, n: n}, nil
}

func pathHash(name string) uint32 {
	h := fnv.New32a()
	h.Write([]byte(name))
	return h.Sum32()
}

func (r *Renderer) Render(name string, flags map[string]any) (*RenderResponse, error) {
	idx := int(pathHash(name)) % r.n
	ch := make(chan renderResult, 1)
	r.workers[idx].queue <- renderJob{name: name, flags: flags, resp: ch}
	res := <-ch
	return res.resp, res.err
}

func (r *Renderer) Close() error {
	var firstErr error
	for _, w := range r.workers {
		if err := w.close(); err != nil && firstErr == nil {
			firstErr = err
		}
	}
	return firstErr
}
