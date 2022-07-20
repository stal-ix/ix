{% extends '//die/c_std.sh' %}

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
export CGO_ENABLED=0
export GOROOT_FINAL="${out}"
{% endblock %}

{% block build %}
bash ./make.bash -v
{% endblock %}

{% block install %}
cd ..
cp -a bin pkg src lib misc api test ${out}/
{% endblock %}

{% block env %}
export GOROOT_BOOTSTRAP="${out}"
{% endblock %}
