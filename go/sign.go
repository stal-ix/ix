package main

import (
	"encoding/json"
	"strings"
)

const uidPlaceholder = "#uid_placeholder#"

func genUDir(suffix string) string {
	return uidPlaceholder + "-" + canonName(suffix)
}

func replaceSentinel(x map[string]any) map[string]any {
	if _, ok := x["uid"]; !ok {
		x["uid"] = uidPlaceholder
	}

	// rep = x.get('predict', x)
	var rep any = x
	if p, ok := x["predict"]; ok {
		rep = p
	}

	// Python: replace_dict(rep, UID, '') = json.loads(json.dumps(rep).replace(UID, ''))
	// json.dumps uses Python default separators (", " and ": ")
	repStr := pyJSON(rep)
	cleaned := strings.ReplaceAll(repStr, uidPlaceholder, "")
	var cleanedObj any
	json.Unmarshal([]byte(cleaned), &cleanedObj)

	// struct_hash = string_hash(json.dumps(obj, sort_keys=True))
	uid := structHash(cleanedObj)

	// Replace placeholder everywhere in the structure
	fullStr := pyJSON(x)
	replaced := strings.ReplaceAll(fullStr, uidPlaceholder, uid)

	var result map[string]any
	json.Unmarshal([]byte(replaced), &result)
	return result
}
