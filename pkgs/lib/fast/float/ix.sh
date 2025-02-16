{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v8.0.0.tar.gz
sha:f312f2dc34c61e665f4b132c0307d6f70ad9420185fa831911bc24408acf625d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
