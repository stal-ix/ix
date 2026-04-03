package main

import (
	"os/user"
	"strings"
)

type Token struct {
	Kind string // "r", "p", "f"
	Op   string // "+", "-"
	V    map[string]string
}

func tok(p string) Token {
	if strings.HasPrefix(p, "--") {
		p = p[2:]
		var k, v string
		if idx := strings.IndexByte(p, '='); idx >= 0 {
			k = p[:idx]
			v = p[idx+1:]
		} else {
			k = p
			v = "1"
		}
		if v == "-" {
			return Token{"f", "-", map[string]string{"k": k, "v": v}}
		}
		return Token{"f", "+", map[string]string{"k": k, "v": v}}
	}

	op := "+"
	if p == "" {
		op = "+"
	} else if p[0] == '+' {
		p = p[1:]
	} else if p[0] == '-' {
		op = "-"
		p = p[1:]
	}

	if strings.Contains(p, "/") {
		return Token{"p", op, map[string]string{"p": p}}
	}
	return Token{"r", op, map[string]string{"r": p}}
}

func lexArgs(args []string) []Token {
	var all []string
	if len(args) == 0 || tok(args[0]).Kind == "r" {
		// already has realm
	} else {
		u, err := user.Current()
		if err == nil {
			all = append(all, u.Username)
		}
	}
	all = append(all, args...)

	var result []Token
	var rlm, pkg string
	for _, p := range all {
		t := tok(p)
		switch t.Kind {
		case "r":
			rlm = t.V["r"]
			pkg = ""
			t.V["r"] = rlm
			result = append(result, t)
		case "p":
			pkg = t.V["p"]
			t.V["r"] = rlm
			result = append(result, t)
		case "f":
			t.V["r"] = rlm
			t.V["p"] = pkg
			result = append(result, t)
		}
	}
	return result
}

func groupRealms(tokens []Token) [][]Token {
	var groups [][]Token
	var cur []Token

	for _, t := range tokens {
		if len(cur) > 0 && cur[0].V["r"] != t.V["r"] {
			groups = append(groups, cur)
			cur = nil
		}
		cur = append(cur, t)
	}
	if len(cur) > 0 {
		groups = append(groups, cur)
	}
	return groups
}
