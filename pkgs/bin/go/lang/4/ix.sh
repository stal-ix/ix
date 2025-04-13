{% extends '//die/c/ix.sh' %}

{% block version %}
20170531
{% endblock %}

{% block fetch %}
https://golang.org/dl/go1.4-bootstrap-{{self.version().strip()}}.tar.gz
sha:49f806f66762077861b7de7081f586995940772d29d4c45068c134441a743fa2
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

{% block setup_target_flags %}
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
