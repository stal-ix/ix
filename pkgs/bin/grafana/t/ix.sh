{% extends '//die/go/build.sh' %}

{% block pkg_name %}
grafana
{% endblock %}

{% block version %}
13.0.1
{% endblock %}

{% block go_url %}
https://github.com/grafana/grafana/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
cc8f04f24b8c30768988e13de75c40e96022830495ceb1092b5d44f3cc431c82
{% endblock %}

{% block go_tool %}
bin/go/lang/25
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
find . -mindepth 2 -name go.mod -delete
find . -mindepth 2 -name go.sum -delete
rm -f go.work go.work.sum
# Strip both the `require github.com/grafana/grafana/apps/X v0.0.0` lines
# and the matching `=> ./X` replaces — after the submodule collapse those
# subpaths are just subpackages of the root module, not separate modules.
sed -i '/github\.com\/grafana\/grafana\//d' go.mod
{% endblock %}
