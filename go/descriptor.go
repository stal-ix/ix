package main

import (
	"encoding/json"
	"strings"
)

// Descr is the parsed JSON descriptor from Jinja2 rendering.
type Descr struct {
	Bld struct {
		Fetch      []FetchEntry `json:"fetch"`
		Script     any          `json:"script"`
		Deps       []string     `json:"deps"`
		HostLibs   []string     `json:"host_libs"`
		TargetLibs []string     `json:"target_libs"`
		Data       []string     `json:"data"`
	} `json:"bld"`
	Run struct {
		Deps []string `json:"deps"`
		Data []string `json:"data"`
	} `json:"run"`
	Fix struct {
		Deps []string `json:"deps"`
	} `json:"fix"`
	Lib struct {
		Deps []string `json:"deps"`
	} `json:"lib"`
	Ind struct {
		Deps []string `json:"deps"`
	} `json:"ind"`
	Net            bool          `json:"net"`
	PredictOutputs []PredictItem `json:"predict_outputs"`
	TaskPool       string        `json:"task_pool"`
	Repo           struct {
		Version string `json:"version"`
		Name    string `json:"name"`
	} `json:"repo"`

	raw map[string]any
}

type FetchEntry struct {
	URL string `json:"url"`
	MD5 string `json:"md5"`
}

type PredictItem struct {
	Path string `json:"path"`
	Sum  string `json:"sum"`
}

func parseDescr(raw map[string]any) (*Descr, error) {
	data, err := json.Marshal(raw)
	if err != nil {
		return nil, err
	}
	var d Descr
	if err := json.Unmarshal(data, &d); err != nil {
		return nil, err
	}
	d.raw = raw
	return &d, nil
}

func (d *Descr) Buildable() bool {
	switch s := d.Bld.Script.(type) {
	case nil:
		return false
	case map[string]any:
		return len(s) > 0
	}
	return false
}

func (d *Descr) ScriptExec() []string {
	s, ok := d.Bld.Script.(map[string]any)
	if !ok {
		return nil
	}
	execRaw, ok := s["exec"]
	if !ok {
		return nil
	}
	switch e := execRaw.(type) {
	case []any:
		var result []string
		for _, v := range e {
			if str, ok := v.(string); ok {
				result = append(result, str)
			}
		}
		return result
	}
	return nil
}

func (d *Descr) ScriptData() string {
	s, ok := d.Bld.Script.(map[string]any)
	if !ok {
		return ""
	}
	if data, ok := s["data"].(string); ok {
		return data
	}
	return ""
}

// parseKind extracts "kind" from package name prefix.
func parseKind(name string) string {
	idx := strings.IndexByte(name, '/')
	if idx < 0 {
		return name
	}
	v := name[:idx]
	switch v {
	case "bld", "etc":
		return "bin"
	}
	return v
}

// parsePkgName parses "lib/foo(flag=val)" into name and flags.
func parsePkgName(v string) (string, map[string]any) {
	a, _, hasParen := strings.Cut(v, "(")
	if !hasParen {
		return a, nil
	}
	// Strip trailing )
	flagStr := v[len(a)+1 : len(v)-1]
	return a, parsePkgFlags(flagStr)
}

func parsePkgFlags(v string) map[string]any {
	flags := map[string]any{}
	for _, x := range strings.Split(v, ",") {
		a, c, _ := strings.Cut(x, "=")
		flags[a] = c
	}
	return flags
}
