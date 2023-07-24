{% extends '//die/std/ix.sh' %}

{% block fetch %}
{{url}}
{{sum}}
{% endblock %}

{% set fname %}go_{{sha}}.tar.lz4{% endset %}

{% block bld_tool %}
bin/go
bld/stable/pack
{% endblock %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{fname}}", "sum": "{{sha}}"}]
{% endblock %}

{% block build %}
export GOCACHE=${tmp}/cgo
export GOMODCACHE=${tmp}/gmc
export GOPROXY="https://proxy.golang.org,direct"

find . -type f -name go.mod | while read l; do (
    cd $(dirname ${l})
    go mod tidy
    go mod vendor
) done

cd ..

stable_pack ${tmp}/{{fname}} src
go clean -modcache
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/{{fname}} ${out}/share/
ls -la ${out}/share/
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
