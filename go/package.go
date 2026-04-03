package main

import (
	"fmt"
	"strings"
)

var ONE_LEVEL = map[string]bool{
	"setx": true, "help": true, "verbose": true, "stage": true,
	"rebuild": true, "nostrip": true, "simulate_failure": true,
	"show_script": true, "skipsrc_one": true,
}

func sanitize(flags map[string]any) map[string]any {
	result := make(map[string]any, len(flags))
	for k, v := range flags {
		if !ONE_LEVEL[k] {
			result[k] = v
		}
	}
	return result
}

func mergeFlags(base, over map[string]any) map[string]any {
	result := make(map[string]any, len(base)+len(over))
	for k, v := range base {
		result[k] = v
	}
	for k, v := range over {
		result[k] = v
	}
	return result
}

type Selector struct {
	Name  string
	Flags map[string]any
}

func (s Selector) cacheKey() string {
	return structHash(map[string]any{"name": s.Name, "flags": s.Flags})
}

func remsuf(s, suf string) string {
	return strings.TrimSuffix(s, suf)
}

type Package struct {
	selector Selector
	descr    *Descr
	uid      string
	pkgName  string
	mgr      *Manager
	boot     bool

	// cached closures
	_bldBinClosure       []*Package
	_libClosure          []*Package
	_bldHostLibClosure   []*Package
	_bldTargetLibClosure []*Package
	_bldData             []*Package
	_runDeps             []*Package
	_runData             []*Package
	_runClosure          []*Package
	_allBuildDepends     []*Package
	_buildDirs           []string
	_buildCmds           []map[string]any

	_bldBinClosureDone       bool
	_libClosureDone          bool
	_bldHostLibClosureDone   bool
	_bldTargetLibClosureDone bool
	_bldDataDone             bool
	_runDepsDone             bool
	_runDataDone             bool
	_runClosureDone          bool
	_allBuildDependsDone     bool
	_buildDirsDone           bool
	_buildCmdsDone           bool
}

func (p *Package) Name() string {
	n := p.selector.Name
	if !strings.HasSuffix(n, ".sh") {
		n += "/ix.sh"
	}
	return n
}

func (p *Package) NormName() string {
	return remsuf(remsuf(p.Name(), ".sh"), "/ix")
}

func (p *Package) Flags() map[string]any {
	return p.selector.Flags
}

func (p *Package) Target() map[string]any {
	if t, ok := p.selector.Flags["target"]; ok {
		if tm, ok := t.(map[string]any); ok {
			return tm
		}
	}
	return nil
}

func (p *Package) OutDir() string {
	return fmt.Sprintf("%s/%s-%s", p.mgr.config.StoreDir(), p.uid, p.pkgName)
}

func (p *Package) Buildable() bool {
	return p.descr.Buildable()
}

func (p *Package) UniqID() string {
	return strings.ReplaceAll(p.pkgName, "-", "_")
}

func (p *Package) calcPkgName() string {
	kind := "lib"
	if k, ok := p.selector.Flags["kind"].(string); ok {
		kind = k
	}
	n := p.NormName()
	if idx := strings.IndexByte(n, '/'); idx >= 0 {
		n = n[idx+1:]
	}
	return canonName(kind + "-" + n)
}

func (p *Package) hostLibFlags() map[string]any {
	return map[string]any{"target": p.mgr.config.Host, "kind": "lib"}
}

func (p *Package) targetLibFlags() map[string]any {
	return sanitize(mergeFlags(p.Flags(), map[string]any{"kind": "lib"}))
}

func (p *Package) binFlags() map[string]any {
	return p.calcBinFlags(p.mgr.config.Host)
}

func (p *Package) calcBinFlags(target map[string]any) map[string]any {
	base := map[string]any{}
	if !p.Buildable() {
		base = p.Flags()
	}
	return mergeFlags(base, map[string]any{"target": target, "kind": "bin"})
}

func (p *Package) loadPackage(n string, flags map[string]any) *Package {
	name, pFlags := parsePkgName(n)
	merged := mergeFlags(flags, pFlags)
	sel := Selector{Name: name, Flags: merged}
	return p.mgr.LoadPackage(sanitize(sel.Flags), sel.Name)
}

func (p *Package) loadPackages(names []string, flags map[string]any) []*Package {
	var result []*Package
	for _, n := range names {
		result = append(result, p.loadPackage(n, flags))
	}
	return result
}

// visitList performs topological traversal with dedup.
func visitList(initial []*Package, childFn func(*Package) []*Package) []*Package {
	seen := map[string]bool{}
	var result []*Package

	var visit func(p *Package)
	visit = func(p *Package) {
		if seen[p.uid] {
			return
		}
		seen[p.uid] = true

		children := childFn(p)
		for i := len(children) - 1; i >= 0; i-- {
			visit(children[i])
		}
		result = append(result, p)
	}

	for i := len(initial) - 1; i >= 0; i-- {
		visit(initial[i])
	}

	// Reverse
	for i, j := 0, len(result)-1; i < j; i, j = i+1, j-1 {
		result[i], result[j] = result[j], result[i]
	}
	return result
}

func (p *Package) bldBinClosure() []*Package {
	if !p._bldBinClosureDone {
		pkgs := p.loadPackages(p.descr.Bld.Deps, p.binFlags())
		p._bldBinClosure = visitList(pkgs, func(x *Package) []*Package { return x.runClosure() })
		p._bldBinClosureDone = true
	}
	return p._bldBinClosure
}

func (p *Package) libClosure() []*Package {
	if !p._libClosureDone {
		pkgs := p.loadPackages(p.descr.Lib.Deps, p.targetLibFlags())
		p._libClosure = visitList(pkgs, func(x *Package) []*Package { return x.libClosure() })
		p._libClosureDone = true
	}
	return p._libClosure
}

func (p *Package) bldHostLibDeps() []string {
	deps := make([]string, len(p.descr.Bld.HostLibs))
	copy(deps, p.descr.Bld.HostLibs)
	for _, bp := range p.bldBinClosure() {
		deps = append(deps, bp.descr.Ind.Deps...)
	}
	return deps
}

func (p *Package) bldTargetLibDeps() []string {
	deps := make([]string, len(p.descr.Bld.TargetLibs))
	copy(deps, p.descr.Bld.TargetLibs)
	for _, bp := range p.bldBinClosure() {
		deps = append(deps, bp.descr.Ind.Deps...)
	}
	return deps
}

func (p *Package) bldHostLibClosure() []*Package {
	if !p._bldHostLibClosureDone {
		pkgs := p.loadPackages(p.bldHostLibDeps(), p.hostLibFlags())
		p._bldHostLibClosure = visitList(pkgs, func(x *Package) []*Package { return x.libClosure() })
		p._bldHostLibClosureDone = true
	}
	return p._bldHostLibClosure
}

func (p *Package) bldTargetLibClosure() []*Package {
	if !p._bldTargetLibClosureDone {
		pkgs := p.loadPackages(p.bldTargetLibDeps(), p.targetLibFlags())
		p._bldTargetLibClosure = visitList(pkgs, func(x *Package) []*Package { return x.libClosure() })
		p._bldTargetLibClosureDone = true
	}
	return p._bldTargetLibClosure
}

func (p *Package) bldData() []*Package {
	if !p._bldDataDone {
		p._bldData = p.loadPackages(p.descr.Bld.Data, map[string]any{"target": p.mgr.config.Host, "kind": "aux"})
		p._bldDataDone = true
	}
	return p._bldData
}

type taggedPkg struct {
	kind string
	pkg  *Package
}

func (p *Package) iterAllTaggedBuildDepends() []taggedPkg {
	var result []taggedPkg
	for _, x := range p.bldBinClosure() {
		result = append(result, taggedPkg{"bin", x})
	}
	for _, x := range p.bldData() {
		result = append(result, taggedPkg{"data", x})
	}
	for _, x := range p.bldTargetLibClosure() {
		result = append(result, taggedPkg{"target lib", x})
	}
	for _, x := range p.bldHostLibClosure() {
		result = append(result, taggedPkg{"host lib", x})
	}
	return result
}

func (p *Package) iterTaggedBuildDepends() []taggedPkg {
	var result []taggedPkg
	for _, tp := range p.iterAllTaggedBuildDepends() {
		if tp.pkg.Buildable() {
			result = append(result, tp)
		}
	}
	return result
}

func (p *Package) iterAllBuildDepends() []*Package {
	if !p._allBuildDependsDone {
		seen := map[string]bool{}
		var result []*Package
		for _, tp := range p.iterTaggedBuildDepends() {
			if !seen[tp.pkg.uid] {
				seen[tp.pkg.uid] = true
				result = append(result, tp.pkg)
			}
		}
		p._allBuildDepends = result
		p._allBuildDependsDone = true
	}
	return p._allBuildDepends
}

func (p *Package) iterBuildDirs() []string {
	if !p._buildDirsDone {
		for _, x := range p.iterAllBuildDepends() {
			p._buildDirs = append(p._buildDirs, x.OutDir())
		}
		p._buildDirsDone = true
	}
	return p._buildDirs
}

func (p *Package) runDeps() []*Package {
	if !p._runDepsDone {
		t := p.Target()
		if t == nil {
			t = p.mgr.config.Host
		}
		p._runDeps = p.loadPackages(p.descr.Run.Deps, p.calcBinFlags(t))
		p._runDepsDone = true
	}
	return p._runDeps
}

func (p *Package) runData() []*Package {
	if !p._runDataDone {
		p._runData = p.loadPackages(p.descr.Run.Data, map[string]any{"target": p.mgr.config.Host, "kind": "aux"})
		p._runDataDone = true
	}
	return p._runData
}

func (p *Package) allRunDeps() []*Package {
	var result []*Package
	result = append(result, p.runDeps()...)
	result = append(result, p.runData()...)

	kind, _ := p.selector.Flags["kind"].(string)
	if kind == "lib" {
		result = append(result, p.libClosure()...)
	}

	for _, tlp := range p.bldTargetLibClosure() {
		result = append(result, tlp.runData()...)
	}
	return result
}

func (p *Package) runClosure() []*Package {
	if !p._runClosureDone {
		p._runClosure = visitList(p.allRunDeps(), func(x *Package) []*Package { return x.runClosure() })
		p._runClosureDone = true
	}
	return p._runClosure
}

func (p *Package) iterAllRuntimeDepends() []*Package {
	var result []*Package
	for _, x := range p.runClosure() {
		if x.Buildable() {
			result = append(result, x)
		}
	}
	return result
}
