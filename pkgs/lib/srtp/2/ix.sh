{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cisco/libsrtp/archive/refs/tags/v2.6.0.tar.gz
sha:bf641aa654861be10570bfc137d1441283822418e9757dc71ebb69a6cf84ea6b
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
