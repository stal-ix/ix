{% extends '//bin/esbuild/ix.sh' %}

{% block pkg_name %}
esbuild
{% endblock %}

{% block version %}
0.18.20
{% endblock %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
84d49c3cd3d383327ddbac2fbac25f4ebcfe0d49b0b49d212ab1bf31d2ba46a9
{% endblock %}
