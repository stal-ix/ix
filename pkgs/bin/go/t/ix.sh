{% extends '//die/c_std.sh' %}

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
