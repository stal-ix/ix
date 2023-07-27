{% extends '//die/std/ix.sh' %}

{% set fname %}go_{{parent_id}}.tar.lz4{% endset %}

{% block bld_tool %}
bin/go
bld/fetch
bld/extract
bld/stable/pack
{% endblock %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{fname}}", "sum": "{{sha}}"}]
{% endblock %}

{% block step_unpack %}
mkdir net
cd net
fetch "{{url}}"
cd ..
mkdir src
cd src
extract 1 ../net/*
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
find src/
stable_pack {{sha}} ${tmp}/{{fname}} src
go clean -modcache
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/{{fname}} ${out}/share/
ls -la ${out}/share/
sha256sum ${out}/share/*
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
