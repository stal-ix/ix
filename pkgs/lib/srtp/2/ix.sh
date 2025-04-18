{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsrtp
{% endblock %}

{% block version %}
2.7.0
{% endblock %}

{% block fetch %}
https://github.com/cisco/libsrtp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:54facb1727a557c2a76b91194dcb2d0a453aaf8e2d0cbbf1e3c2848c323e28ad
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
