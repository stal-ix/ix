{% extends '//die/go/build.sh' %}

{% block pkg_name %}
grafana
{% endblock %}

{% block version %}
13.3.0
{% endblock %}

{% block go_url %}
https://github.com/grafana/grafana/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1ba0a49d427ac09e9aabb05a79a9dc17a8e77d5a8ee54c307790bcd1b0aef49a
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_refine %}
# Grafana's repo is a go.work workspace: the root go.mod carries
# `replace github.com/grafana/grafana/apps/X => ./apps/X` directives
# that only resolve inside a workspace. aux/go/v3 runs `go mod tidy`
# on every go.mod individually with GOWORK=off, which breaks both
# directions: submodules can't see intra-repo imports, and the root's
# own `replace => ./X` fails once the submodule go.mod vanishes.
#
# Collapse the tree into a single module: drop every non-root
# go.mod/go.sum (so submodule code is just subpackages of the root
# module), strip the matching `replace => ./X` lines (they have no
# targets anymore), and nuke testdata fixtures + go.work.
find . -type d -name testdata -prune -exec rm -rf {} +
# Tests import from testdata/ — nuke them too so `go mod tidy` doesn't
# try to resolve paths whose source just disappeared.
find . -name '*_test.go' -delete
# Fold every submodule's pins into the root first. `go mod tidy` walks
# all packages in the module, so once the collapse makes submodule code
# root code, their imports need versions — and with the submodule go.mod
# already gone, tidy resolves them to whatever upstream published today.
# That is what kept rotting the recorded hash: pkg/build pins
# dagger.io/dagger v0.18.8 and gqlgen v0.17.73, and tidy was pulling
# newer ones. Conflicting versions across submodules are fine, MVS picks
# the max in tidy right after.
find . -mindepth 2 -name go.mod | while read l; do
    awk '/^require \(/{r=1;next} r&&/^\)/{r=0;next} r' "${l}" |
        sed -n 's|^\t\([^ ]*\) \(v[^ ]*\).*|-require=\1@\2|p'
    sed -n 's|^require \([^ ]*\) \(v[^ ]*\).*|-require=\1@\2|p' "${l}"
done | sort -u | xargs -r -n 64 go mod edit
find . -mindepth 2 -name go.mod -delete
find . -mindepth 2 -name go.sum -delete
rm -f go.work go.work.sum
# Strip both the `require github.com/grafana/grafana/apps/X v0.0.0` lines
# and the matching `=> ./X` replaces — after the submodule collapse those
# subpaths are just subpackages of the root module, not separate modules.
sed -i '/github\.com\/grafana\/grafana\//d' go.mod
{% endblock %}
