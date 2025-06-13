{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fribidi
{% endblock %}

{% block version %}
1.0.16
{% endblock %}

{% block fetch %}
https://github.com/fribidi/fribidi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5a1d187a33daa58fcee2ad77f0eb9d136dd6fa4096239199ba31e850d397e8a8
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
