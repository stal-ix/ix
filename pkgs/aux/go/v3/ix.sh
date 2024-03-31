{% extends '//aux/fetch/ix.sh' %}

{% block fname %}
go_v3_{{parent_id}}.pzd
{% endblock %}

{% block bld_tool %}
{{go_tool}}
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
