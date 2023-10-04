{% extends '//die/go/c.sh' %}

{% block step_unpack %}
mkdir src; cd src
base64 -d << EOF | sed -e 's|__port__|{{port}}|' -e 's|__from__|{{from}}|' > serve.go
{% include 'serve.go/base64' %}
EOF
{% endblock %}

{% block go_build_flags %}
serve.go
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp serve ${out}/bin/serve_ix_mirror
{% endblock %}
