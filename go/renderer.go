package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"io"
	"os/exec"
	"sync"
)

// Renderer communicates with render.py over stdin/stdout.
type Renderer struct {
	cmd    *exec.Cmd
	stdin  io.WriteCloser
	reader *bufio.Reader
	mu     sync.Mutex
	Host   map[string]any
}

type RenderRequest struct {
	Name  string         `json:"name"`
	Flags map[string]any `json:"flags"`
}

type RenderResponse struct {
	Descr map[string]any `json:"descr,omitempty"`
	Boot  bool           `json:"boot,omitempty"`
	Error string         `json:"error,omitempty"`
}

func NewRenderer(selfDir string) (*Renderer, error) {
	script := selfDir + "/render.py"
	cmd := exec.Command("python3", script)
	cmd.Dir = selfDir + "/.."

	stdin, err := cmd.StdinPipe()
	if err != nil {
		return nil, err
	}

	stdout, err := cmd.StdoutPipe()
	if err != nil {
		return nil, err
	}

	cmd.Stderr = nil // inherit

	if err := cmd.Start(); err != nil {
		return nil, fmt.Errorf("start render.py: %w", err)
	}

	reader := bufio.NewReaderSize(stdout, 1<<20)

	// Read initial host config line
	line, err := reader.ReadBytes('\n')
	if err != nil {
		cmd.Process.Kill()
		return nil, fmt.Errorf("read host config: %w", err)
	}

	var initResp struct {
		Host map[string]any `json:"host"`
	}
	if err := json.Unmarshal(line, &initResp); err != nil {
		cmd.Process.Kill()
		return nil, fmt.Errorf("parse host config: %w", err)
	}

	return &Renderer{
		cmd:    cmd,
		stdin:  stdin,
		reader: reader,
		Host:   initResp.Host,
	}, nil
}

func (r *Renderer) Render(name string, flags map[string]any) (*RenderResponse, error) {
	r.mu.Lock()
	defer r.mu.Unlock()

	req := RenderRequest{Name: name, Flags: flags}
	data, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}

	data = append(data, '\n')
	if _, err := r.stdin.Write(data); err != nil {
		return nil, fmt.Errorf("write to render.py: %w", err)
	}

	line, err := r.reader.ReadBytes('\n')
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

func (r *Renderer) Close() error {
	r.stdin.Close()
	return r.cmd.Wait()
}
