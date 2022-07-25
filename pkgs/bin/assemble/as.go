package main

import (
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"strings"
	"sync"
	"syscall"
)

const (
	ESC = "\x1b"
	RST = ESC + "[0m"
	R   = ESC + "[91m"
	G   = ESC + "[92m"
	Y   = ESC + "[93m"
	B   = ESC + "[94m"
)

func color(color string, s string) string {
	return color + s + RST
}

func red(s string) string {
	return color(R, s)
}

func abort(v any) {
	fmt.Println(red(fmt.Sprintf("abort: %v", v)))
	os.Exit(1)
}

type Semaphore struct {
	ch chan int
}

func newSemaphore(n int) *Semaphore {
	return &Semaphore{ch: make(chan int, n)}
}

func (self *Semaphore) acquire(n int) {
	for i := 0; i < n; i += 1 {
		self.ch <- 0
	}
}

func (self *Semaphore) release(n int) {
	for i := 0; i < n; i += 1 {
		<-self.ch
	}
}

type Cmd struct {
	Args  []string          `json:"args"`
	Stdin string            `json:"stdin"`
	Env   map[string]string `json:"env"`
}

type Node struct {
	InDirs  []string `json:"in_dir"`
	OutDirs []string `json:"out_dir"`
	Cmds    []Cmd    `json:"cmd"`
	Pool    string   `json:"pool"`
}

type Graph struct {
	Nodes   []Node         `json:"nodes"`
	Targets []string       `json:"targets"`
	Pools   map[string]int `json:"pools"`
}

type nodectx struct {
	lock   sync.Mutex
	data   *Node
	future *Future
}

func toFiles(dirs []string) []string {
	res := []string{}

	for _, d := range dirs {
		res = append(res, d+"/touch")
	}

	return res
}

func outs(node *Node) []string {
	return toFiles(node.OutDirs)
}

func ins(node *Node) []string {
	return toFiles(node.InDirs)
}

func checkExists(path string) bool {
	_, err := os.Stat(path)

	return err == nil
}

func env(cmd *Cmd) []string {
	ret := []string{}

	for k, v := range cmd.Env {
		ret = append(ret, k+"="+v)
	}

	return ret
}

func lookupPath(prog string, path string) string {
	if prog[:1] == "/" {
		return prog
	}

	for _, p := range strings.Split(path, ":") {
		pp := p + "/" + prog

		if checkExists(pp) {
			return pp
		}
	}

	abort(fmt.Sprintf("can not find %s in %s", prog, path))

	return ""
}

func complete(node *Node) bool {
	for _, o := range outs(node) {
		if !checkExists(o) {
			return false
		}

		fmt.Println(color(G, "READY "+o))
	}

	return true
}

func executeCmd(c *Cmd) {
	cmd := &exec.Cmd{
		Path:   lookupPath(c.Args[0], c.Env["PATH"]),
		Args:   c.Args,
		Env:    env(c),
		Dir:    "/",
		Stdin:  strings.NewReader(c.Stdin),
		Stdout: os.Stderr,
		Stderr: os.Stderr,
	}

	if err := cmd.Run(); err != nil {
		abort(fmt.Sprintf("subcommand error: %v", err))
	}
}

func executeNode(node *Node) {
	for _, o := range outs(node) {
		fmt.Println(color(B, "ENTER "+o))
	}

	for _, cmd := range node.Cmds {
		executeCmd(&cmd)
	}

	syscall.Sync()

	for _, o := range outs(node) {
		if file, err := os.Create(o); err == nil {
			file.Close()
		}

		fmt.Println(color(B, "LEAVE "+o))
	}

	syscall.Sync()
}

type Future struct {
	f func()
	o sync.Once
}

func (self *Future) callOnce() {
	self.o.Do(self.f)
}

type Executor struct {
	byOut map[string]*nodectx
	sem   map[string]*Semaphore
}

func (self *Executor) execute(node *Node) {
	if complete(node) {
		return
	}

	self.visitAll(ins(node))
	sem, _ := self.sem[node.Pool]
	sem.acquire(1)
	defer sem.release(1)
	executeNode(node)
}

func newNodeFuture(ex *Executor, node *Node) *Future {
	return &Future{f: func() {
		ex.execute(node)
	}}
}

func newExecutor(graph *Graph) *Executor {
	byOut := map[string]*nodectx{}

	for i := range graph.Nodes {
		node := &nodectx{
			data: &graph.Nodes[i],
		}

		for _, out := range outs(node.data) {
			byOut[out] = node
		}
	}

	sem := map[string]*Semaphore{}

	for pool, count := range graph.Pools {
		sem[pool] = newSemaphore(count)
	}

	// validate
	for _, node := range graph.Nodes {
		for _, in := range ins(&node) {
			if _, ok := byOut[in]; !ok {
				abort(fmt.Sprintf("no node generate %s", in))
			}
		}

		if _, ok := sem[node.Pool]; !ok {
			abort(fmt.Sprintf("bad pool %s", node.Pool))
		}
	}

	return &Executor{byOut: byOut, sem: sem}
}

func (self *Executor) futureFor(node *nodectx) *Future {
	node.lock.Lock()
	defer node.lock.Unlock()

	if node.future == nil {
		node.future = newNodeFuture(self, node.data)
	}

	return node.future
}

func (self *Executor) visitAll(nodes []string) {
	wg := &sync.WaitGroup{}
	defer wg.Wait()

	for _, n := range nodes {
		o := self.byOut[n]

		wg.Add(1)

		go func() {
			defer wg.Done()
			self.futureFor(o).callOnce()
		}()
	}
}

func main() {
	var graph Graph

	if err := json.NewDecoder(os.Stdin).Decode(&graph); err != nil {
		abort(fmt.Sprintf("can not parse input graph: %v", err))
	}

	newExecutor(&graph).visitAll(graph.Targets)
}
