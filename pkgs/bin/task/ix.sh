{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/go-task/task/archive/refs/tags/v3.14.0.tar.gz
{% endblock %}

{% block go_sha %}
f6391d190bd42b0cffe14a5677e2fedfd1f2b7e1a3c74f83341200e7945d339c
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/task
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp task ${out}/bin/
{% endblock %}
