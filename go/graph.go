package main

import (
	"os"
	"runtime"
	"strconv"
)

func recNode(p *Package) []*Package {
	var result []*Package
	result = append(result, p)
	result = append(result, p.iterAllBuildDepends()...)
	result = append(result, p.iterAllRuntimeDepends()...)
	return result
}

func recNodes(nodes []*RealmCtx) []*Package {
	seen := map[string]bool{}
	var result []*Package

	var visit func(p *Package)
	visit = func(p *Package) {
		if seen[p.uid] {
			return
		}
		seen[p.uid] = true
		result = append(result, p)

		for _, dep := range recNode(p) {
			visit(dep)
		}
	}

	for _, rc := range nodes {
		// Visit realm's build depends (which include all transitive packages)
		for _, p := range rc.iterAllBuildDepends() {
			visit(p)
		}
		for _, p := range rc.iterAllRuntimeDepends() {
			visit(p)
		}
	}
	return result
}

func buildCommands(nodes []*RealmCtx) []map[string]any {
	var result []map[string]any
	seen := map[string]bool{}

	for _, p := range recNodes(nodes) {
		if p.Buildable() {
			for _, cmd := range p.iterBuildCommands() {
				key := structHash(cmd)
				if !seen[key] {
					seen[key] = true
					result = append(result, cmd)
				}
			}
		}
	}

	// Also add realm build commands
	for _, rc := range nodes {
		for _, cmd := range rc.iterBuildCommands() {
			key := structHash(cmd)
			if !seen[key] {
				seen[key] = true
				result = append(result, cmd)
			}
		}
	}

	return result
}

func slots(t int) int {
	if t > 16 {
		// int(t**0.5)
		s := 1
		for s*s <= t {
			s++
		}
		return s - 1
	}
	if t > 11 {
		return 4
	}
	if t > 7 {
		return 3
	}
	if t > 3 {
		return 2
	}
	return 1
}

func BuildGraph(nodes []*RealmCtx) map[string]any {
	t := runtime.NumCPU()
	if v := os.Getenv("IX_THREADS"); v != "" {
		if n, err := strconv.Atoi(v); err == nil {
			t = n
		}
	}

	cmds := buildCommands(nodes)

	// Validate
	for _, n := range cmds {
		if n["pool"] == "network" {
			if _, ok := n["predict"]; !ok {
				panic("invalid network node without predict")
			}
		}
	}

	var targets []string
	for _, rc := range nodes {
		targets = append(targets, rc.OutDir()+"/touch")
	}

	pools := map[string]any{
		"full":    1,
		"slot":    slots(t),
		"misc":    4,
		"threads": t,
		"network": 16,
	}
	if t > 32 {
		pools["full"] = 2
	}
	if t == 1 {
		pools = map[string]any{
			"full": 1, "slot": 1, "misc": 1, "threads": 1, "network": 1,
		}
	}

	return map[string]any{
		"nodes":   cmds,
		"targets": targets,
		"pools":   pools,
	}
}
