{% extends '//aux/fetch/ix.sh' %}

{% set fname %}go_{{parent_id}}.tar.lz4{% endset %}

{% block bld_tool %}
bin/go
{{super()}}
{% endblock %}

{% block build %}
export GOSUMDB=off
export GOCACHE=${tmp}/cgo
export GOMODCACHE=${tmp}/gmc
export GOPROXY="https://proxy.golang.org,direct"

{% if go_refine %}
{{go_refine | b64d}}
{% endif %}

find . -type f -name go.mod | while read l; do (
    cd $(dirname ${l})
    go mod tidy
    go mod vendor
) done
{% endblock %}

{% block step_build %}
{{super()}}
go clean -modcache
{% endblock %}
