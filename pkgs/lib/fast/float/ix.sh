{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fast_float
{% endblock %}

{% block version %}
8.2.3
{% endblock %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v{{self.version().strip()}}.tar.gz
fa811076bad7b7151ce826005a7213971c879b192ee4505a7016c8413038c2d0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
