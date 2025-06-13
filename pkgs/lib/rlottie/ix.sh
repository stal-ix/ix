{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
rlottie
{% endblock %}

{% block version %}
0.2
{% endblock %}

{% block fetch %}
https://github.com/Samsung/rlottie/archive/refs/tags/v{{self.version().strip()}}.tar.gz
030ccbc270f144b4f3519fb3b86e20dd79fb48d5d55e57f950f12bab9b65216a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block meson_flags %}
module=false
cmake=true
{% endblock %}
