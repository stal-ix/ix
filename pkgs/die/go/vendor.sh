{% extends '//die/std/ix.sh' %}

{% block fetch %}
{{url}}
{{sum}}
{% endblock %}

{% block bld_tool %}
bin/go
bin/tar
{% endblock %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{parent_id}}.tgz", "sum": "{{sha}}"}]
{% endblock %}

{% block build %}
export GOCACHE=${tmp}/cgo
export GOMODCACHE=${tmp}/gmc
export GOPROXY="https://proxy.golang.org,direct"

find . -type f -name go.mod | while read l; do (
    cd $(dirname ${l})
    go mod vendor
) done

cd ..

tar --sort=name --owner=root:0 --group=root:0 --mtime='UTC 1970-01-01'  -c -f ${tmp}/{{parent_id}}.tgz src
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/{{parent_id}}.tgz ${out}/share/
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
