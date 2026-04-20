{% extends '//die/go/build.sh' %}

{% block pkg_name %}
perses
{% endblock %}

{% block version %}
0.53.1
{% endblock %}

{% block go_url %}
https://github.com/perses/perses/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
8707946e2d6c4e5f9d96bed8255cfbb48005ca88df93b3f85513e17db217da67
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gzip
{% endblock %}

{% block go_refine %}
# Perses ships test fixtures with their own go.mod files. aux/go/v3
# recurses into every go.mod and runs `go mod tidy`; keep the recursion
# on real modules by dropping the testdata trees.
find . -type d -name testdata -prune -exec rm -rf {} +
{% endblock %}

{% block unpack %}
{{super()}}
# Upstream's scripts/compress_assets.sh writes ui/embed.go from ui/app/dist;
# without it `go build ./cmd/perses` fails because ui/endpoint.go references
# an embedFS that only exists after this step. We stub a one-file app/dist
# so the UI path compiles; panel plugins are a separate lift, the admin
# HTTP + /metrics come up either way. Done at unpack rather than go_refine
# because the fetch env lacks gzip.
(
    cd ui
    cp embed.go.tmpl embed.go
    mkdir -p app/dist
    printf '<!doctype html><meta charset=utf-8><title>Perses</title><p>UI not built (stal-ix source build).' > app/dist/index.html
    gzip -f app/dist/index.html
    printf '//go:embed app/dist/index.html.gz\nvar embedFS embed.FS\n' >> embed.go
)
cd cmd/perses
{% endblock %}

{% block go_bins %}
perses
{% endblock %}
