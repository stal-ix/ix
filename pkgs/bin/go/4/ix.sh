{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://golang.org/dl/go1.4-bootstrap-20170531.tar.gz
md5:d2cc61cb9f829b3510ee39c0c5568014
{% endblock %}

{% block bld_tool %}
bld/bash
bld/pkg/config
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block setup %}
{% block cgo %}
export CGO_ENABLED=0
{% endblock %}
export GOROOT_FINAL="${out}/bin/{{uniq_id}}"
{% endblock %}

{% block build %}
bash ./make.bash -v
{% endblock %}

{% block install %}
mkdir -p ${GOROOT_FINAL}
cd ..
cp -a bin pkg src lib misc api test ${GOROOT_FINAL}/
cd ${out}/bin
for x in go gofmt; do
    ln -s {{uniq_id}}/bin/${x} ${x}
done
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export GOROOT_BOOTSTRAP="${GOROOT_FINAL}"
{% endblock %}
