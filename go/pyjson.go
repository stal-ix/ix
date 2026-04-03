package main

import (
	"fmt"
	"math"
	"sort"
	"strconv"
	"strings"
)

// pyJSON serializes a value to JSON matching Python's json.dumps(v, sort_keys=True).
// Python uses ", " between items and ": " between key/value pairs.
func pyJSON(v any) string {
	var sb strings.Builder
	writePyJSON(&sb, v)
	return sb.String()
}

func writePyJSON(sb *strings.Builder, v any) {
	switch vv := v.(type) {
	case nil:
		sb.WriteString("null")
	case bool:
		if vv {
			sb.WriteString("true")
		} else {
			sb.WriteString("false")
		}
	case string:
		writeJSONString(sb, vv)
	case float64:
		// Python prints integers without decimal point
		if vv == math.Trunc(vv) && !math.IsInf(vv, 0) && !math.IsNaN(vv) {
			sb.WriteString(strconv.FormatInt(int64(vv), 10))
		} else {
			sb.WriteString(strconv.FormatFloat(vv, 'g', -1, 64))
		}
	case int:
		sb.WriteString(strconv.Itoa(vv))
	case int64:
		sb.WriteString(strconv.FormatInt(vv, 10))
	case map[string]any:
		sb.WriteByte('{')
		keys := make([]string, 0, len(vv))
		for k := range vv {
			keys = append(keys, k)
		}
		sort.Strings(keys)
		for i, k := range keys {
			if i > 0 {
				sb.WriteString(", ")
			}
			writeJSONString(sb, k)
			sb.WriteString(": ")
			writePyJSON(sb, vv[k])
		}
		sb.WriteByte('}')
	case []any:
		sb.WriteByte('[')
		for i, item := range vv {
			if i > 0 {
				sb.WriteString(", ")
			}
			writePyJSON(sb, item)
		}
		sb.WriteByte(']')
	case []string:
		sb.WriteByte('[')
		for i, item := range vv {
			if i > 0 {
				sb.WriteString(", ")
			}
			writeJSONString(sb, item)
		}
		sb.WriteByte(']')
	case []map[string]any:
		sb.WriteByte('[')
		for i, item := range vv {
			if i > 0 {
				sb.WriteString(", ")
			}
			writePyJSON(sb, item)
		}
		sb.WriteByte(']')
	default:
		// Fallback: use fmt
		b, _ := fmt.Fprintf(sb, "%v", vv)
		_ = b
	}
}

func writeJSONString(sb *strings.Builder, s string) {
	sb.WriteByte('"')
	for _, r := range s {
		switch r {
		case '"':
			sb.WriteString(`\"`)
		case '\\':
			sb.WriteString(`\\`)
		case '\n':
			sb.WriteString(`\n`)
		case '\r':
			sb.WriteString(`\r`)
		case '\t':
			sb.WriteString(`\t`)
		default:
			if r < 0x20 {
				fmt.Fprintf(sb, `\u%04x`, r)
			} else {
				sb.WriteRune(r)
			}
		}
	}
	sb.WriteByte('"')
}
