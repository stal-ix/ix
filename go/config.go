package main

import (
	"os"
	"path/filepath"
	"strings"
)

type Config struct {
	Host     map[string]any
	Binary   string
	IxDir    string
	Overlays []string
}

func (c *Config) StoreDir() string {
	return filepath.Join(c.IxDir, "store")
}

func (c *Config) BuildDir() string {
	return filepath.Join(c.IxDir, "build")
}

func (c *Config) RealmDir() string {
	return filepath.Join(c.IxDir, "realm")
}

func (c *Config) TrashDir() string {
	return filepath.Join(c.IxDir, "trash")
}

func (c *Config) BootPath() string {
	// Check if running on stalix
	if _, err := os.Stat("/bin/bin_ix/assemble"); err == nil {
		return "/ix/realm/boot/bin:/bin:/usr/bin:/usr/local/bin"
	}
	if _, err := os.Stat("/bin/assemble"); err == nil {
		return "/ix/realm/boot/bin:/bin:/usr/bin:/usr/local/bin"
	}
	return os.Getenv("PATH")
}

func (c *Config) IsSystem() bool {
	if _, err := os.Stat("/bin/bin_ix/assemble"); err == nil {
		return true
	}
	if _, err := os.Stat("/bin/assemble"); err == nil {
		return true
	}
	return false
}

func (c *Config) Retarget(target any) map[string]any {
	switch t := target.(type) {
	case map[string]any:
		return t
	case string:
		return archConfig(t)
	}
	return nil
}

func newConfig(selfDir string, host map[string]any) *Config {
	binary := filepath.Join(selfDir, "..", "ix")
	ixDir := envOr("IX_ROOT", "/ix")
	overlays := findPkgDirs(binary)

	return &Config{
		Host:     host,
		Binary:   binary,
		IxDir:    ixDir,
		Overlays: overlays,
	}
}

func findPkgDirs(binary string) []string {
	pkgs := filepath.Dir(binary) + "/pkgs"
	path := os.Getenv("IX_PATH")
	if path == "" {
		return []string{pkgs}
	}

	var dirs []string
	for _, p := range strings.Split(path, ":") {
		if p == "{builtin}" {
			dirs = append(dirs, pkgs)
		} else {
			dirs = append(dirs, p)
		}
	}
	return dirs
}

func envOr(key, def string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return def
}
