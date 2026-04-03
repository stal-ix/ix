package main

import (
	"crypto/md5"
	"strings"
)

const b62chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

// b62from128 encodes a 128-bit little-endian number as 22 base62 characters.
// Matches Python: ''.join(b62(hashlib.md5(s.encode()).digest()))
func b62from128(lo, hi uint64) string {
	var result [22]byte
	for x := 0; x < 22; x++ {
		remHi := hi % 62
		hi = hi / 62

		loLo := lo & 0xFFFFFFFF
		loHi := lo >> 32

		temp := remHi<<32 | loHi
		qHi := temp / 62
		remMid := temp % 62

		temp2 := remMid<<32 | loLo
		qLo := temp2 / 62
		remainder := temp2 % 62

		lo = qHi<<32 | qLo
		result[x] = b62chars[remainder]
	}
	return string(result[:])
}

func stringHash(s string) string {
	h := md5.Sum([]byte(s))
	lo := uint64(0)
	hi := uint64(0)
	for i := 7; i >= 0; i-- {
		lo = lo<<8 | uint64(h[i])
	}
	for i := 15; i >= 8; i-- {
		hi = hi<<8 | uint64(h[i])
	}
	return b62from128(lo, hi)
}

// structHash computes hash of JSON-serialized value with sorted keys.
// Matches Python: cu.struct_hash(d) = string_hash(json.dumps(d, sort_keys=True))
// Python json.dumps uses ", " and ": " separators by default.
func structHash(v any) string {
	return stringHash(pyJSON(v))
}

func canonName(n string) string {
	var sb strings.Builder
	for _, ch := range n {
		switch {
		case ch >= 'a' && ch <= 'z', ch >= 'A' && ch <= 'Z', ch >= '0' && ch <= '9':
			sb.WriteRune(ch)
		case ch == '+':
			sb.WriteString("-plus-")
		default:
			sb.WriteByte('-')
		}
	}
	result := strings.ToLower(sb.String())
	for strings.Contains(result, "--") {
		result = strings.ReplaceAll(result, "--", "-")
	}
	return strings.TrimRight(result, "-")
}
