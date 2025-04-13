{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsrtp
{% endblock %}

{% block version %}
2.6.0
{% endblock %}

{% block fetch %}
https://github.com/cisco/libsrtp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:bf641aa654861be10570bfc137d1441283822418e9757dc71ebb69a6cf84ea6b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
