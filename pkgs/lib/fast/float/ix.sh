{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fast_float
{% endblock %}

{% block version %}
8.1.0
{% endblock %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4bfabb5979716995090ce68dce83f88f99629bc17ae280eae79311c5340143e1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
