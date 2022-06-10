{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/Samsung/rlottie/archive/refs/tags/v0.2.tar.gz
sha:030ccbc270f144b4f3519fb3b86e20dd79fb48d5d55e57f950f12bab9b65216a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block meson_flags %}
module=false
cmake=true
{% endblock %}
