package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
)

func main() {
	if len(os.Args) < 3 || os.Args[1] != "build" {
		fmt.Fprintf(os.Stderr, "usage: ix build <pkg>\n")
		os.Exit(1)
	}

	pkgName := os.Args[2]

	selfDir, err := findSelfDir()
	if err != nil {
		fatal(err)
	}

	renderer, err := NewRenderer(selfDir)
	if err != nil {
		fatal(err)
	}
	defer renderer.Close()

	config := newConfig(selfDir, renderer.Host)
	mgr := NewManager(config, renderer)

	// Build like: ix build lib/c => prepare(['ephemeral', 'lib/c'])
	realmName := "ephemeral"
	ops := lexArgs([]string{realmName, pkgName})
	groups := groupRealms(ops)

	var nodes []*RealmCtx
	for _, g := range groups {
		realm := mgr.EnsureRealm(g[0].V["r"])
		rc := realm.Mut(g)
		nodes = append(nodes, rc)
	}

	graph := BuildGraph(nodes)

	enc := json.NewEncoder(os.Stdout)
	enc.SetIndent("", "    ")
	enc.SetEscapeHTML(false)
	if err := enc.Encode(graph); err != nil {
		fatal(err)
	}
}

func fatal(err error) {
	fmt.Fprintf(os.Stderr, "error: %v\n", err)
	os.Exit(1)
}

func findSelfDir() (string, error) {
	// Try to find render.py relative to executable
	exe, err := os.Executable()
	if err == nil {
		dir := filepath.Dir(exe)
		if _, err := os.Stat(filepath.Join(dir, "render.py")); err == nil {
			return dir, nil
		}
	}

	// Fallback: look for go/ directory relative to cwd
	cwd, err := os.Getwd()
	if err != nil {
		return "", err
	}

	// Check if we're in the go/ directory
	if _, err := os.Stat(filepath.Join(cwd, "render.py")); err == nil {
		return cwd, nil
	}

	// Check go/ subdirectory
	goDir := filepath.Join(cwd, "go")
	if _, err := os.Stat(filepath.Join(goDir, "render.py")); err == nil {
		return goDir, nil
	}

	return "", fmt.Errorf("cannot find render.py")
}
