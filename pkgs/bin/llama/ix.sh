{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/antonmedv/llama/archive/refs/tags/v1.4.0.tar.gz
{% endblock %}

{% block go_sha %}
96d86dba895a9bf5077aabbb8a13913fba0f1854efd443861930b3de64a22a6f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp llama ${out}/bin/
{% endblock %}
