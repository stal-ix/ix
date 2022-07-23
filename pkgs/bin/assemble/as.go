package main

import (
    "os"
    "fmt"
    "log"
    "strings"
    "os/exec"
    "encoding/json"
)

const (
    ESC = "\x1b"
    RST = ESC + "[0m"
    R = ESC + "[91m"
    G = ESC + "[92m"
    Y = ESC + "[93m"
    B = ESC + "[94m"
)

type Cmd struct {
    Args []string `json:"args"`
    Stdin string `json:"stdin"`
    Env map[string]string `json:"env"`
}

type Node struct {
    InDirs []string `json:"in_dir"`
    OutDirs []string `json:"out_dir"`
    Cmds []Cmd `json:"cmd"`
}

type Graph struct {
    Nodes []Node `json:"nodes"`
    Targets []string `json:"targets"`
}

func toFiles(dirs []string) []string {
    res := []string{}

    for _, d := range dirs {
        res = append(res, d + "/touch")
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
    if _, err := os.Stat(path); err == nil {
        return true
    }

    return false
}

func env(cmd *Cmd) []string {
    ret := []string{}

    for k, v := range cmd.Env {
        ret = append(ret, k + "=" + v)
    }

    return ret
}

func lookupPath(prog string, path string) string {
    for _, p := range strings.Split(path, ":") {
        pp := p + "/" + prog

        if checkExists(pp) {
            return pp
        }
    }

    log.Fatalf("%scan not find %s in %s%s\n", R, prog, path, RST)

    return ""
}

func complete(node *Node) bool {
    for _, o := range outs(node) {
        if !checkExists(o) {
            return false
        }

        fmt.Printf("%sREADY %s%s\n", G, o, RST)
    }

    return true
}

func executeCmd(c *Cmd) {
    cmd := exec.Cmd{
        Path: lookupPath(c.Args[0], c.Env["PATH"]),
        Args: c.Args,
        Env: env(c),
        Dir: "/",
        Stdin: strings.NewReader(c.Stdin),
        Stdout: os.Stdout,
        Stderr: os.Stderr,
    }

    if err := cmd.Run(); err != nil {
        log.Fatal(err)
    }
}

func executeNode(node *Node) {
    for _, o := range outs(node) {
        fmt.Printf("%sINFLY %s%s\n", Y, o, RST)
    }

    for _, cmd := range node.Cmds {
        executeCmd(&cmd)
    }

    for _, o := range outs(node) {
        if file, err := os.Create(o); err == nil {
            file.Close()
        }

        fmt.Printf("%sREADY %s%s\n", G, o, RST)
    }
}

func main() {
    var graph Graph

    err := json.NewDecoder(os.Stdin).Decode(&graph)

    if err != nil {
        log.Fatal(err)
    }

    byOut := map[string]*Node{}

    for i, _ := range graph.Nodes {
        node := &graph.Nodes[i]

        for _, out := range outs(node) {
            byOut[out] = node
        }
    }

    vis := map[*Node]bool{}

    var visit func (*Node)

    visit = func (node *Node) {
        if node == nil {
            log.Fatal(R + "empty node" + RST)
        }

        if _, ok := vis[node]; ok {
            return
        }

        vis[node] = true

        if complete(node) {
            return
        }

        for _, i := range ins(node) {
            visit(byOut[i])
        }

        executeNode(node)

    }

    for _, target := range graph.Targets {
        visit(byOut[target])
    }
}
