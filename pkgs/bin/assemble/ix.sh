{% extends '//die/go/c.sh' %}

{% block step_unpack %}
mkdir src; cd src
base64 -d << EOF> assemble.go
{% include 'as.go/base64' %}
EOF
{% endblock %}

{% block bld_tool %}
bld/pack
{% endblock %}

{% block go_build_flags %}
assemble.go
{% endblock %}

{% block install %}
mkdir ${out}/bin
packexe assemble
cp assemble ${out}/bin/
{% endblock %}
