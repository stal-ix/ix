package main

import (
	"fmt"
)

type Manager struct {
	config   *Config
	renderer *Renderer
	cache    map[string]*Package
}

func NewManager(config *Config, renderer *Renderer) *Manager {
	return &Manager{
		config:   config,
		renderer: renderer,
		cache:    make(map[string]*Package),
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

	if p, ok := m.cache[key]; ok {
		return p
	}

	// Render template
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

	// Cache early to handle cycles
	m.cache[key] = pkg

	// Compute UID
	if pkg.Buildable() {
		cmds := pkg.iterBuildCommands()
		if len(cmds) > 0 {
			last := cmds[len(cmds)-1]
			if uid, ok := last["uid"].(string); ok {
				pkg.uid = uid
			}
		}
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
