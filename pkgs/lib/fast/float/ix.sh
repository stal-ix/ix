{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fast_float
{% endblock %}

{% block version %}
8.2.10
{% endblock %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v{{self.version().strip()}}.tar.gz
76f958dd97b1cf4d8862d1f0986a47d4bdfa8845252bae15ef0f40de3b95961f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
