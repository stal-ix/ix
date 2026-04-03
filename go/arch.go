package main

import (
	"fmt"
	"runtime"
	"strings"
)

func multiUpdate(base map[string]any, others ...map[string]any) map[string]any {
	result := copyMap(base)
	for _, o := range others {
		for k, v := range o {
			result[k] = v
		}
	}
	return result
}

func copyMap(m map[string]any) map[string]any {
	result := make(map[string]any, len(m))
	for k, v := range m {
		switch vv := v.(type) {
		case map[string]any:
			result[k] = copyMap(vv)
		default:
			result[k] = v
		}
	}
	return result
}

func getRawArch(n string) map[string]any {
	if strings.Contains(n, "-") {
		parts := strings.Split(n, "-")
		result := map[string]any{}
		for _, p := range parts {
			result = multiUpdate(result, getRawArch(p))
		}
		return result
	}

	switch n {
	case "linux":
		return map[string]any{
			"os": "linux", "kernel": "linux", "obj_fmt": "elf",
			"cmake_system_name": "Linux", "rust_os": "linux-musl",
		}
	case "darwin":
		return map[string]any{
			"clang_os": "darwin11", "os": "darwin", "kernel": "xnu",
			"vendor": "apple", "obj_fmt": "mach-o",
			"cmake_system_name": "Darwin", "dl_suffix": "dylib",
			"symbol_prefix": "_",
		}
	case "freebsd":
		return map[string]any{
			"os": "freebsd", "kernel": "freebsd", "obj_fmt": "elf",
			"cmake_system_name": "FreeBSD", "rust_os": "freebsd",
		}
	case "mingw_w64":
		return map[string]any{
			"os": "mingw32", "kernel": "nt", "obj_fmt": "coff",
			"cmake_system_name": "Windows", "vendor": "w64",
			"exe_suffix": ".exe",
		}
	case "x86_64":
		return map[string]any{"gnu_arch": "x86_64", "family": "x86"}
	case "aarch64":
		return map[string]any{"gnu_arch": "aarch64", "family": "arm"}
	case "arm64":
		return multiUpdate(getRawArch("darwin-aarch64"), map[string]any{"arch": "arm64"})
	case "armv7":
		return map[string]any{"bits": float64(32), "gnu_arch": "armv7", "family": "arm"}
	case "riscv64":
		return map[string]any{"gnu_arch": "riscv64", "family": "riscv"}
	case "wasm32":
		return map[string]any{"gnu_arch": "wasm32", "family": "wasm"}
	case "wasm64":
		return map[string]any{"gnu_arch": "wasm64", "family": "wasm"}
	case "wasi":
		return map[string]any{
			"os": "wasi", "kernel": "wasi", "obj_fmt": "wasm",
			"cmake_system_name": "WASI",
		}
	case "wasi32":
		return getRawArch("wasi-wasm32")
	case "wasi64":
		return getRawArch("wasi-wasm64")
	case "mingw64":
		return getRawArch("mingw_w64-x86_64")
	case "gnueabihf":
		return map[string]any{
			"hard_float": true,
			"gnu": map[string]any{"three": "armv7-linux-gnueabihf"},
		}
	}
	panic(fmt.Sprintf("unknown target: %s", n))
}

func mapStr(m map[string]any, key string) string {
	if v, ok := m[key]; ok {
		if s, ok := v.(string); ok {
			return s
		}
	}
	return ""
}

func enrich(d map[string]any) map[string]any {
	d = copyMap(d)

	if _, ok := d["vendor"]; !ok {
		d["vendor"] = "unknown"
	}
	if _, ok := d["gnu_vendor"]; !ok {
		d["gnu_vendor"] = mapStr(d, "vendor")
	}
	if _, ok := d["rust_vendor"]; !ok {
		d["rust_vendor"] = mapStr(d, "gnu_vendor")
	}
	if _, ok := d["gnu_arch"]; !ok {
		if a := mapStr(d, "arch"); a != "" {
			ga := a
			if a == "arm64" {
				ga = "aarch64"
			}
			d["gnu_arch"] = ga
		}
	}
	if _, ok := d["arch"]; !ok {
		d["arch"] = mapStr(d, "gnu_arch")
	}
	if _, ok := d["bits"]; !ok {
		kk := mapStr(d, "arch") + mapStr(d, "gnu_arch")
		if strings.Contains(kk, "64") {
			d["bits"] = float64(64)
		}
		if strings.Contains(kk, "32") {
			d["bits"] = float64(32)
		}
	}

	gnuArch := mapStr(d, "gnu_arch")

	if _, ok := d["llvm_target"]; !ok {
		m := map[string]string{
			"aarch64": "AArch64", "x86_64": "X86", "armv7": "ARM",
			"riscv64": "RISCV", "wasm32": "TODO", "wasm64": "TODO",
		}
		d["llvm_target"] = m[gnuArch]
	}
	if _, ok := d["linux_arch"]; !ok {
		m := map[string]string{"aarch64": "arm64", "riscv64": "riscv", "armv7": "arm"}
		if v, ok := m[gnuArch]; ok {
			d["linux_arch"] = v
		} else {
			d["linux_arch"] = gnuArch
		}
	}
	if _, ok := d["go_arch"]; !ok {
		m := map[string]string{"aarch64": "arm64", "x86_64": "amd64"}
		if v, ok := m[gnuArch]; ok {
			d["go_arch"] = v
		} else {
			d["go_arch"] = gnuArch
		}
	}
	if _, ok := d["endian"]; !ok {
		d["endian"] = "little"
	}
	if _, ok := d["dl_suffix"]; !ok {
		if mapStr(d, "obj_fmt") == "elf" {
			d["dl_suffix"] = "so"
		}
	}
	if _, ok := d["clang_os"]; !ok {
		d["clang_os"] = mapStr(d, "os")
	}

	// add_gnu
	gnu, ok := d["gnu"].(map[string]any)
	if !ok {
		gnu = map[string]any{}
		d["gnu"] = gnu
	}
	if _, ok := gnu["three"]; !ok {
		gnu["three"] = fmt.Sprintf("%s-%s-%s", gnuArch, mapStr(d, "gnu_vendor"), mapStr(d, "os"))
	}
	if _, ok := gnu["four"]; !ok {
		gnu["four"] = fmt.Sprintf("%s-%s", gnu["three"], mapStr(d, "obj_fmt"))
	}

	if _, ok := d["uname_m"]; !ok {
		d["uname_m"] = mapStr(d, "arch")
	}
	if _, ok := d["uname_s"]; !ok {
		d["uname_s"] = mapStr(d, "cmake_system_name")
	}

	bits := float64(64)
	if b, ok := d["bits"].(float64); ok {
		bits = b
	}
	d["ptrlen"] = bits / 8

	if _, ok := d["exe_suffix"]; !ok {
		d["exe_suffix"] = ""
	}
	if _, ok := d["id"]; !ok {
		d["id"] = structHash(d)
	}
	if _, ok := d["rust_os"]; !ok {
		d["rust_os"] = mapStr(d, "os")
	}
	if _, ok := d["rust"]; !ok {
		if mapStr(d, "os") == "mingw32" {
			d["rust"] = fmt.Sprintf("%s-pc-windows-gnullvm", gnuArch)
		} else {
			d["rust"] = fmt.Sprintf("%s-%s-%s", gnuArch, mapStr(d, "rust_vendor"), mapStr(d, "rust_os"))
		}
	}

	return d
}

func archConfig(n string) map[string]any {
	n = strings.ReplaceAll(n, "mingw-w64", "mingw_w64")
	return enrich(getRawArch(n))
}

func hostArch() map[string]any {
	osName := strings.ToLower(runtime.GOOS)
	arch := runtime.GOARCH
	// Map Go arch names to ix names
	switch arch {
	case "amd64":
		arch = "x86_64"
	case "arm64":
		arch = "aarch64"
	}
	return archConfig(osName + "-" + arch)
}
