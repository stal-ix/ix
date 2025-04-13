{% extends '//bin/esbuild/ix.sh' %}

{% block pkg_name %}
esbuild
{% endblock %}

{% block version %}
0.21.5
{% endblock %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f6fabb47144504e31c0c32b750b485ec316eded08e3f7ebf2fc631121509453e
{% endblock %}
