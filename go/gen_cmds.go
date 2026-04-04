package main

import (
	"encoding/json"
	"os/exec"
	"path/filepath"
	"strings"
)

func revDirs(pkgs []*Package) string {
	var parts []string
	for i := len(pkgs) - 1; i >= 0; i-- {
		parts = append(parts, pkgs[i].OutDir())
	}
	return strings.Join(parts, ":")
}

func cmdFetch(cfg *Config, url, cksum string) map[string]any {
	name := filepath.Base(url)
	odir := filepath.Join(cfg.StoreDir(), genUDir("url-"+name))
	path := filepath.Join(odir, name)

	return map[string]any{
		"out_dir": []string{odir},
		"cmd":     genFetchCmds(cfg, url, path, cksum),
		"path":    path,
		"pool":    "network",
		"predict": []map[string]any{
			{"path": path, "sum": cksum},
		},
	}
}

func genFetchCmds(cfg *Config, url, path, cksum string) []map[string]any {
	if cfg.IsSystem() {
		fetcher := findBinary("fetcher")
		if fetcher != "" {
			return []map[string]any{
				{"args": []string{fetcher, url, path, cksum}, "stdin": "", "env": map[string]any{}},
			}
		}
	}

	// Local mode: use python misc fetch
	env := map[string]any{"PATH": cfg.BootPath()}
	return []map[string]any{
		{
			"args":  []string{"python3", cfg.Binary, "misc", "fetch", url, path, cksum},
			"stdin": "",
			"env":   env,
		},
	}
}

func findBinary(name string) string {
	paths := []string{"/ix/realm/system/bin", "/bin", "/bin/bin_ix"}
	for _, dir := range paths {
		p := filepath.Join(dir, name)
		if _, err := exec.LookPath(p); err == nil {
			return p
		}
	}
	return ""
}

func toStringSlice(v any) []string {
	switch vv := v.(type) {
	case []string:
		return vv
	case []any:
		var result []string
		for _, item := range vv {
			if s, ok := item.(string); ok {
				result = append(result, s)
			}
		}
		return result
	}
	return nil
}

func cmdLink(cfg *Config, extra []map[string]any, outDir string) map[string]any {
	var inDirs []string
	for _, e := range extra {
		inDirs = append(inDirs, toStringSlice(e["out_dir"])...)
	}

	var files []string
	for _, e := range extra {
		files = append(files, e["path"].(string))
	}

	return map[string]any{
		"in_dir":  inDirs,
		"out_dir": []string{outDir},
		"cmd":     genLinkCmds(cfg, files, outDir),
		"pool":    "misc",
	}
}

func genLinkCmds(cfg *Config, files []string, out string) []map[string]any {
	if cfg.IsSystem() {
		var cmds []map[string]any
		cmds = append(cmds, map[string]any{
			"args": []string{"/bin/purge", out}, "stdin": "", "env": map[string]any{},
		})
		cmds = append(cmds, map[string]any{
			"args": []string{"/bin/mkdir", "-p", out}, "stdin": "", "env": map[string]any{},
		})
		for _, f := range files {
			cmds = append(cmds, map[string]any{
				"args": []string{"/bin/ln", f, filepath.Join(out, filepath.Base(f))}, "stdin": "", "env": map[string]any{},
			})
		}
		return cmds
	}

	// Local mode
	var cmds []map[string]any
	args := []string{"python3", cfg.Binary, "misc", "link", out}
	args = append(args, files...)
	cmds = append(cmds, map[string]any{
		"args": args, "stdin": "", "env": map[string]any{},
	})
	return cmds
}

func toMapSlice(v any) []map[string]any {
	switch vv := v.(type) {
	case []map[string]any:
		return vv
	case []any:
		var result []map[string]any
		for _, item := range vv {
			if m, ok := item.(map[string]any); ok {
				result = append(result, m)
			}
		}
		return result
	}
	return nil
}

func fixNode(cfg *Config, node map[string]any) map[string]any {
	if cfg.IsSystem() {
		if pred, ok := node["predict"]; ok {
			node = deepCopyMap(node)
			predList := toMapSlice(pred)
			cmds := toMapSlice(node["cmd"])
			for _, p := range predList {
				path := p["path"].(string)
				sum := p["sum"].(string)
				cmds = append(cmds, genChecksumCmds(path, sum)...)
			}
			// Convert back to []any for JSON compat
			var cmdAny []any
			for _, c := range cmds {
				cmdAny = append(cmdAny, c)
			}
			node["cmd"] = cmdAny
		}
	}
	return replaceSentinel(node)
}

func splitCksum(cksum string) (string, string) {
	if idx := strings.IndexByte(cksum, ':'); idx >= 0 {
		return cksum[:idx], cksum[idx+1:]
	}
	return "sha", cksum
}

func genChecksumCmds(path, cksum string) []map[string]any {
	f, s := splitCksum(cksum)
	prog := map[string]string{"sha": "sha256"}
	if v, ok := prog[f]; ok {
		f = v
	}
	sumProg := "/bin/" + f + "sum"

	return []map[string]any{
		{"args": []string{"/bin/echo", cksum}, "stdin": "", "env": map[string]any{}},
		{"args": []string{sumProg, path}, "stdin": "", "env": map[string]any{}},
		{"args": []string{sumProg, "-cw", "-"}, "stdin": s + "  " + path + "\n", "env": map[string]any{}},
	}
}

func reparentPredict(pred []PredictItem, outDir string) []map[string]any {
	var result []map[string]any
	for _, p := range pred {
		result = append(result, map[string]any{
			"path": outDir + "/" + p.Path,
			"sum":  p.Sum,
		})
	}
	return result
}

func deepCopyMap(m map[string]any) map[string]any {
	data, _ := json.Marshal(m)
	var result map[string]any
	json.Unmarshal(data, &result)
	return result
}

func (p *Package) iterBuildCommands() []map[string]any {
	if p._buildCmdsDone {
		return p._buildCmds
	}
	p._buildCmdsDone = true

	cfg := p.mgr.config

	var cmds []map[string]any

	if len(p.descr.Bld.Fetch) > 0 {
		var extra []map[string]any
		for _, fe := range p.descr.Bld.Fetch {
			f := fixNode(cfg, cmdFetch(cfg, fe.URL, fe.MD5))
			cmds = append(cmds, f)
			extra = append(extra, f)
		}

		lnkOutDir := filepath.Join(cfg.StoreDir(), genUDir("lnk"))
		lnk := fixNode(cfg, cmdLink(cfg, extra, lnkOutDir))
		cmds = append(cmds, lnk)

		lnkDirSlice := toStringSlice(lnk["out_dir"])

		srcDir := ""
		if len(lnkDirSlice) > 0 {
			srcDir = lnkDirSlice[0]
		}

		rec := p.buildMainCmd(srcDir, lnkDirSlice)
		cmds = append(cmds, fixNode(cfg, rec))
	} else {
		rec := p.buildMainCmd("", nil)
		cmds = append(cmds, fixNode(cfg, rec))
	}

	p._buildCmds = cmds
	return cmds
}

func (p *Package) buildMainCmd(srcDir string, extraInDirs []string) map[string]any {
	cfg := p.mgr.config

	// Build environment
	env := map[string]any{}

	var hBin, hLib, tLib []*Package
	for _, tp := range p.iterTaggedBuildDepends() {
		if strings.Contains(tp.kind, "lib") {
			if strings.Contains(tp.kind, "target") {
				tLib = append(tLib, tp.pkg)
			} else {
				hLib = append(hLib, tp.pkg)
			}
		} else {
			hBin = append(hBin, tp.pkg)
		}
	}

	env["IX_B_DIR"] = revDirs(hBin)
	env["IX_H_DIR"] = revDirs(hLib)
	env["IX_T_DIR"] = revDirs(tLib)

	var pathParts []string
	for _, bp := range hBin {
		pathParts = append(pathParts, bp.OutDir()+"/bin")
	}
	env["PATH"] = strings.Join(pathParts, ":")

	if srcDir != "" {
		env["src"] = srcDir
	}
	env["uid"] = p.uid
	env["out"] = p.OutDir()
	env["tmp"] = cfg.BuildDir() + "/" + p.uid

	// Build script command
	scriptExec := p.descr.ScriptExec()
	scriptData := p.descr.ScriptData()

	cmd := map[string]any{
		"args":  scriptExec,
		"stdin": scriptData,
		"env":   env,
	}

	inDirs := append(p.iterBuildDirs(), extraInDirs...)

	pool := p.descr.TaskPool
	if p.descr.Net {
		pool = "network"
	}

	rec := map[string]any{
		"uid":     p.uid,
		"in_dir":  inDirs,
		"out_dir": []string{p.OutDir()},
		"cmd":     []map[string]any{cmd},
		"pool":    pool,
	}

	if len(p.descr.PredictOutputs) > 0 {
		rec["predict"] = reparentPredict(p.descr.PredictOutputs, p.OutDir())
	}

	return rec
}
