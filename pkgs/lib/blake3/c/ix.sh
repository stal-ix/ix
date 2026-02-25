{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
BLAKE3
{% endblock %}

{% block version %}
1.8.3
{% endblock %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/{{self.version().strip()}}.tar.gz
5a11e3f834719b6c1cae7aced1e848a37013f6f10f97272e7849aa0da769f295
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
