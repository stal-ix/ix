{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fribidi
{% endblock %}

{% block version %}
1.0.17
{% endblock %}

{% block fetch %}
https://github.com/fribidi/fribidi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ab015bb040b2ff4bf815813c21948947dad1e0186473359e99a8881c79878d5d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
docs=false
tests=false
{% endblock %}
