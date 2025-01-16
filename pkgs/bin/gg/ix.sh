{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/2a334b9f7b77491dccc32a0a2653206ee6213f92.zip
{% endblock %}

{% block go_sha %}
fc5bf114bba1fe191ccf83aa13381139f882c3d68efd1f490a74a13c5d2888b2
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
