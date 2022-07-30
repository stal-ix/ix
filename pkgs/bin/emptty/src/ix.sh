{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/tvrzna/emptty/archive/864c0ec71bdb9309b0458fdaae141654ad04aa93.tar.gz
sem:17a33795aee47d65721505bf6bb011d3638cfa46d1af313cc79eba8e452a3b97
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
