{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsrtp
{% endblock %}

{% block version %}
2.8.1
{% endblock %}

{% block fetch %}
https://github.com/cisco/libsrtp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ef5569220749529d778013aae1178391d972570a2b4f7288dda22effa875b07c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
