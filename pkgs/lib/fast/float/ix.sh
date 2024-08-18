{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v6.1.4.tar.gz
sha:12cb6d250824160ca16bcb9d51f0ca7693d0d10cb444f34f1093bc02acfce704
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
