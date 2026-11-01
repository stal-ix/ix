{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fast_float
{% endblock %}

{% block version %}
8.3.3
{% endblock %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4dd695f051893c8218faf2ed9871fa4a4990aa6aee2d3190ed7bfa2e83092245
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
