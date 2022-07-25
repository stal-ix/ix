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

type semaphore struct {
	ch chan struct{}
}

func newSemaphore(n int) *semaphore {
	return &semaphore{
		ch: make(chan struct{}, n),
	}
}

func (self *semaphore) acquire(n int) {
	for i := 0; i < n; i += 1 {
		self.ch <- struct{}{}
	}
}

func (self *semaphore) release(n int) {
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
	future *future
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

type future struct {
	f func()
	o sync.Once
}

func (self *future) callOnce() {
	self.o.Do(self.f)
}

type executor struct {
	out map[string]*nodectx
	sem map[string]*semaphore
}

func (self *executor) execute(node *Node) {
	if complete(node) {
		return
	}

	self.visitAll(ins(node))
	sem, _ := self.sem[node.Pool]
	sem.acquire(1)
	defer sem.release(1)
	executeNode(node)
}

func newNodeFuture(ex *executor, node *Node) *future {
	return &future{f: func() {
		ex.execute(node)
	}}
}

func newExecutor(graph *Graph) *executor {
	res := &executor{
		out: map[string]*nodectx{},
		sem: map[string]*semaphore{},
	}

	// construct backrefs
	for i := range graph.Nodes {
		node := &nodectx{
			data: &graph.Nodes[i],
		}

		for _, out := range outs(node.data) {
			res.out[out] = node
		}
	}

	// construct scheduler
	for pool, count := range graph.Pools {
		res.sem[pool] = newSemaphore(count)
	}

	// validate
	for _, node := range graph.Nodes {
		for _, in := range ins(&node) {
			if _, ok := res.out[in]; !ok {
				abort(fmt.Sprintf("no node generate %s", in))
			}
		}

		if _, ok := res.sem[node.Pool]; !ok {
			abort(fmt.Sprintf("bad pool %s", node.Pool))
		}
	}

	return res
}

func (self *executor) futureFor(node *nodectx) *future {
	l := &node.lock

	l.Lock()
	defer l.Unlock()

	if node.future == nil {
		node.future = newNodeFuture(self, node.data)
	}

	return node.future
}

func (self *executor) visitAll(nodes []string) {
	wg := &sync.WaitGroup{}
	defer wg.Wait()

	for _, n := range nodes {
		o := self.out[n]

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
