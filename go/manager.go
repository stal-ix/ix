package main

import (
	"fmt"
	"sync"
)

type future struct {
	done chan struct{}
	pkg  *Package
}

type Manager struct {
	config   *Config
	renderer *Renderer
	mu       sync.Mutex
	futures  map[string]*future
}

func NewManager(config *Config, renderer *Renderer) *Manager {
	return &Manager{
		config:   config,
		renderer: renderer,
		futures:  make(map[string]*future),
	}
}

func (m *Manager) fixSelector(name string, flags map[string]any) Selector {
	if flags == nil {
		flags = map[string]any{}
	} else {
		flags = copyMap(flags)
	}

	if _, ok := flags["target"]; !ok {
		flags["target"] = m.config.Host
	} else {
		flags["target"] = m.config.Retarget(flags["target"])
	}

	if !hasStringSuffix(name, ".sh") {
		name = name + "/ix.sh"
	}

	if _, ok := flags["kind"]; !ok {
		flags["kind"] = parseKind(name)
	}

	return Selector{Name: name, Flags: flags}
}

func hasStringSuffix(s, suffix string) bool {
	return len(s) >= len(suffix) && s[len(s)-len(suffix):] == suffix
}

func (m *Manager) LoadPackage(flags map[string]any, name string) *Package {
	sel := m.fixSelector(name, flags)
	key := sel.cacheKey()

	m.mu.Lock()
	if f, ok := m.futures[key]; ok {
		// Someone else is already computing this — wait for them
		m.mu.Unlock()
		<-f.done
		return f.pkg
	}

	// Register ourselves
	f := &future{done: make(chan struct{})}
	m.futures[key] = f
	m.mu.Unlock()

	pkg := m.doLoad(sel)

	f.pkg = pkg
	close(f.done)

	return pkg
}

func (m *Manager) doLoad(sel Selector) *Package {
	resp, err := m.renderer.Render(sel.Name, sel.Flags)
	if err != nil {
		panic(fmt.Sprintf("render %s: %v", sel.Name, err))
	}

	descr, err := parseDescr(resp.Descr)
	if err != nil {
		panic(fmt.Sprintf("parse descr %s: %v", sel.Name, err))
	}

	pkg := &Package{
		selector: sel,
		descr:    descr,
		mgr:      m,
		uid:      uidPlaceholder,
		boot:     resp.Boot,
	}

	pkg.pkgName = pkg.calcPkgName()

	if resp.Boot && pkg.Buildable() {
		pkg.selector.Flags["boot"] = true
	}

	// Compute UID — triggers recursive dep loading.
	// Also eagerly compute all closures so that by the time the future
	// is resolved, no other goroutine will race on lazy caches.
	if pkg.Buildable() {
		cmds := pkg.iterBuildCommands()
		if len(cmds) > 0 {
			last := cmds[len(cmds)-1]
			if uid, ok := last["uid"].(string); ok {
				pkg.uid = uid
			}
		}
		// Pre-fill closures so concurrent readers don't race
		pkg.runClosure()
		pkg.libClosure()
	} else {
		var uids []string
		for _, rp := range pkg.iterAllRuntimeDepends() {
			uids = append(uids, rp.uid)
		}
		pkg.uid = structHash(uids)
	}

	return pkg
}

func (m *Manager) EnsureRealm(name string) *RealmBase {
	return &RealmBase{
		mgr:  m,
		name: name,
		pkgs: RealmPkgs{List: nil, Flags: map[string]any{}},
	}
}
