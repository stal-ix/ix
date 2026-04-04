package main

import (
	"fmt"
	"strings"
	"sync"
)

type RealmPkgs struct {
	List  []RealmPkgEntry `json:"list"`
	Flags map[string]any  `json:"flags"`
}

type RealmPkgEntry struct {
	Name  string         `json:"name"`
	Flags map[string]any `json:"flags"`
}

type RealmBase struct {
	mgr  *Manager
	name string
	pkgs RealmPkgs
}

func (r *RealmBase) Mut(patch []Token) *RealmCtx {
	newPkgs := applyPatch(r.pkgs.Flags, r.pkgs.List, patch)
	return newRealmCtx(r.mgr, r.name, newPkgs)
}

type RealmCtx struct {
	mgr     *Manager
	PkgName string
	pkgs    RealmPkgs
	uid     string

	_runtimeDepends []*Package
	_buildDepends   []*Package
	_fixDepends     []string
	_runtimeDone    bool
	_buildDone      bool
	_fixDone        bool
}

func newRealmCtx(mgr *Manager, name string, pkgs RealmPkgs) *RealmCtx {
	rc := &RealmCtx{
		mgr:     mgr,
		PkgName: name,
		pkgs:    pkgs,
		uid:     uidPlaceholder,
	}

	// Compute UID from build commands
	cmds := rc.iterBuildCommands()
	if len(cmds) > 0 {
		last := cmds[len(cmds)-1]
		if uid, ok := last["uid"].(string); ok {
			rc.uid = uid
		}
	}

	return rc
}

func (rc *RealmCtx) OutDir() string {
	return fmt.Sprintf("%s/%s-rlm-%s", rc.mgr.config.StoreDir(), rc.uid, rc.PkgName)
}

func (rc *RealmCtx) Buildable() bool {
	return true
}

func (rc *RealmCtx) flatPkgs() []Selector {
	flags := mergeFlags(rc.pkgs.Flags, map[string]any{"target_realm": rc.PkgName})
	var result []Selector
	for _, p := range rc.pkgs.List {
		merged := mergeFlags(flags, p.Flags)
		result = append(result, Selector{Name: p.Name, Flags: merged})
	}
	return result
}

func (rc *RealmCtx) loadPackages(sels []Selector) []*Package {
	if len(sels) <= 1 {
		var result []*Package
		for _, s := range sels {
			result = append(result, rc.mgr.LoadPackage(s.Flags, s.Name))
		}
		return result
	}

	result := make([]*Package, len(sels))
	var wg sync.WaitGroup
	wg.Add(len(sels))
	for i, s := range sels {
		i, s := i, s
		go func() {
			defer wg.Done()
			result[i] = rc.mgr.LoadPackage(s.Flags, s.Name)
		}()
	}
	wg.Wait()
	return result
}

func (rc *RealmCtx) iterAllRuntimeDepends() []*Package {
	if !rc._runtimeDone {
		seen := map[string]bool{}
		var result []*Package
		for _, p := range rc.loadPackages(rc.flatPkgs()) {
			if !seen[p.uid] && p.Buildable() {
				seen[p.uid] = true
				result = append(result, p)
			}
			for _, rp := range p.iterAllRuntimeDepends() {
				if !seen[rp.uid] {
					seen[rp.uid] = true
					result = append(result, rp)
				}
			}
		}
		rc._runtimeDepends = result
		rc._runtimeDone = true
	}
	return rc._runtimeDepends
}

func (rc *RealmCtx) iterAllFixDepends() []string {
	if !rc._fixDone {
		seen := map[string]bool{}
		for _, d := range rc.iterAllRuntimeDepends() {
			for _, fd := range d.descr.Fix.Deps {
				if !seen[fd] {
					seen[fd] = true
					rc._fixDepends = append(rc._fixDepends, fd)
				}
			}
		}
		rc._fixDone = true
	}
	return rc._fixDepends
}

func (rc *RealmCtx) iterAllBuildDepends() []*Package {
	if !rc._buildDone {
		seen := map[string]bool{}

		flags := map[string]any{}
		for k, v := range rc.pkgs.Flags {
			flags["target_"+k] = v
		}
		flags["target_fixers"] = strings.Join(rc.iterAllFixDepends(), "\n")

		// Load bld/realm
		realmPkg := rc.mgr.LoadPackage(flags, "bld/realm")
		if !seen[realmPkg.uid] && realmPkg.Buildable() {
			seen[realmPkg.uid] = true
			rc._buildDepends = append(rc._buildDepends, realmPkg)
		}
		for _, rp := range realmPkg.iterAllRuntimeDepends() {
			if !seen[rp.uid] {
				seen[rp.uid] = true
				rc._buildDepends = append(rc._buildDepends, rp)
			}
		}

		for _, rp := range rc.iterAllRuntimeDepends() {
			if !seen[rp.uid] {
				seen[rp.uid] = true
				rc._buildDepends = append(rc._buildDepends, rp)
			}
		}

		rc._buildDone = true
	}
	return rc._buildDepends
}

func (rc *RealmCtx) iterBuildCommands() []map[string]any {
	var links []any
	for _, p := range rc.iterAllRuntimeDepends() {
		links = append(links, p.OutDir())
	}

	// Build JSON manually to match Python's dict insertion order
	var listEntries []string
	for _, p := range rc.pkgs.List {
		listEntries = append(listEntries,
			"{\"name\": "+pyJSON(p.Name)+", \"flags\": "+pyJSON(p.Flags)+"}")
	}
	listJSON := "[" + strings.Join(listEntries, ", ") + "]"
	pkgsJSON := "{\"flags\": " + pyJSON(rc.pkgs.Flags) + ", \"list\": " + listJSON + "}"
	descrJSON := "{\"pkgs\": " + pkgsJSON + ", \"links\": " + pyJSON(links) + "}"

	var pathParts []string
	for _, p := range rc.iterAllBuildDepends() {
		pathParts = append(pathParts, p.OutDir()+"/bin")
	}

	cmd := map[string]any{
		"args":  []string{"prepare_realm", rc.OutDir()},
		"stdin": descrJSON,
		"env": map[string]any{
			"PATH": strings.Join(pathParts, ":"),
		},
	}

	node := map[string]any{
		"uid":     rc.uid,
		"in_dir":  func() []string {
			var dirs []string
			for _, p := range rc.iterAllBuildDepends() {
				dirs = append(dirs, p.OutDir())
			}
			return dirs
		}(),
		"out_dir": []string{rc.OutDir()},
		"cmd":     []map[string]any{cmd},
		"pool":    "misc",
	}

	return []map[string]any{replaceSentinel(node)}
}

// applyPatch merges realm state with a token patch.
func applyPatch(flags map[string]any, pkgs []RealmPkgEntry, patch []Token) RealmPkgs {
	// Build ops from existing state + patch
	var ops []Token

	// Destruct existing
	ops = append(ops, Token{"p", "+", map[string]string{"p": ""}}) // dummy for flags
	for _, p := range pkgs {
		ops = append(ops, Token{"p", "+", map[string]string{"p": p.Name}})
		for k, v := range p.Flags {
			if vs, ok := v.(string); ok {
				ops = append(ops, Token{"f", "+", map[string]string{"p": p.Name, "k": k, "v": vs}})
			}
		}
	}

	// Apply patch
	ops = append(ops, patch...)

	// Reconstruct
	d := map[string]map[string]string{}
	var order []string

	for _, op := range ops {
		switch op.Kind {
		case "p":
			p := op.V["p"]
			if op.Op == "+" {
				if _, ok := d[p]; !ok {
					d[p] = map[string]string{}
					order = append(order, p)
				}
			} else {
				delete(d, p)
				var newOrder []string
				for _, o := range order {
					if o != p {
						newOrder = append(newOrder, o)
					}
				}
				order = newOrder
			}
		case "f":
			p := op.V["p"]
			k := op.V["k"]
			v := op.V["v"]
			if _, ok := d[p]; ok {
				if op.Op == "+" {
					d[p][k] = v
				} else {
					delete(d[p], k)
				}
			}
		}
	}

	var resultList []RealmPkgEntry
	for _, name := range order {
		if name == "" {
			continue // skip dummy
		}
		entry := RealmPkgEntry{Name: name, Flags: map[string]any{}}
		for k, v := range d[name] {
			entry.Flags[k] = v
		}
		resultList = append(resultList, entry)
	}

	resultFlags := map[string]any{}
	if df, ok := d[""]; ok {
		for k, v := range df {
			resultFlags[k] = v
		}
	}
	// Merge original flags
	for k, v := range flags {
		if _, ok := resultFlags[k]; !ok {
			resultFlags[k] = v
		}
	}

	return RealmPkgs{List: resultList, Flags: resultFlags}
}
