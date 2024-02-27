{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v6.1.0.tar.gz
sha:a9c8ca8ca7d68c2dbb134434044f9c66cfd4c383d5e85c36b704d30f6be82506
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
