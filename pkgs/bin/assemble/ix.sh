{% extends '//die/go/base.sh' %}

{% block step_unpack %}
mkdir src; cd src
base64 -d << EOF> assemble.go
{% include 'as.go/base64' %}
EOF
{% endblock %}

{% block go_build_flags %}
assemble.go
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp assemble ${out}/bin/
{% endblock %}
