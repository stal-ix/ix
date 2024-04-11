{% extends '//die/go/base.sh' %}

{% block step_unpack %}
mkdir src; cd src
base64 -d << EOF> main.go
{% include 'main.go/base64' %}
EOF
{% endblock %}

{% block go_build_flags %}
main.go
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp main ${out}/bin/ssh3-gencert
{% endblock %}
