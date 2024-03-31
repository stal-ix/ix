{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/go-task/task/archive/refs/tags/v3.14.0.tar.gz
{% endblock %}

{% block go_sha %}
140e9e91906b8f2c1a2ea66ee62c2dc6a9ec5f2cc672e878c81c3058deb46dda
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/task
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp task ${out}/bin/
{% endblock %}
