package main

import (
	"testing"
)

func TestStringHash(t *testing.T) {
	// Test against Python: cu.string_hash("hello")
	got := stringHash("hello")
	want := "9qg9rpaw5Hdi3n09rUWWs4" // from Python
	if got != want {
		t.Errorf("stringHash(\"hello\") = %q, want %q", got, want)
	}
}

func TestCanonName(t *testing.T) {
	tests := []struct {
		in, want string
	}{
		{"lib-c", "lib-c"},
		{"bin-realm-scripts", "bin-realm-scripts"},
		{"lib/c/bare", "lib-c-bare"},
		{"C++", "c-plus-plus"},
	}
	for _, tt := range tests {
		got := canonName(tt.in)
		if got != tt.want {
			t.Errorf("canonName(%q) = %q, want %q", tt.in, got, tt.want)
		}
	}
}

func TestB62(t *testing.T) {
	// Test: md5("hello") in Python
	// hashlib.md5(b"hello").digest() = bytes
	// Then b62 encoding
	// Let's verify with Python output
	got := stringHash("hello")
	t.Logf("stringHash(hello) = %s", got)

	got2 := stringHash(`{"name": "test"}`)
	t.Logf("stringHash(json) = %s", got2)
}
