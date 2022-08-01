{% extends '//die/std/ix.sh' %}

{% block fetch %}
{{url}}
{{sum}}
{% endblock %}

{% block bld_tool %}
bin/go
bin/tar
bin/liner
{% endblock %}

{% block use_network %}true{% endblock %}

{% block build %}
export GOCACHE=${tmp}/cgo
export GOMODCACHE=${tmp}/gmc
export GOPROXY="https://proxy.golang.org,direct"

find . -type f -name go.mod | while read l; do (
    cd $(dirname ${l})
    go mod vendor
) done

cd ..

tar --sort=name --owner=root:0 --group=root:0 --mtime='UTC 1970-01-01'  -c -f ${tmp}/git.tgz src

sha256sum ${tmp}/git.tgz
liner cksum "{{sha}}" ${tmp}/git.tgz
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/git.tgz ${out}/share/
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
