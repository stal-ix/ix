{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gcla/termshark/archive/refs/tags/v2.4.0.tar.gz
{% endblock %}

{% block go_sha %}
2cd6d34adfcd2545553a4daa36a9c5fea7b588f3189bd7c052c23db627cebb87
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/termshark
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp termshark ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
