{% extends '//die/std/ix.sh' %}

{% block fetch %}
{{url}}
{{sum}}
{% endblock %}

{% block bld_tool %}
bin/go
bin/tar
{% endblock %}

{% block build %}
export GOCACHE=${tmp}/cgo
export GOMODCACHE=${tmp}/gmc
export GOPROXY="https://proxy.golang.org,direct"
go mod vendor
cd ..
tar -c --group=ix --owner=ix --mtime=0 --sort=name -f ${tmp}/git.tgz src
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
