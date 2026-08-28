{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsrtp
{% endblock %}

{% block version %}
2.8.0
{% endblock %}

{% block fetch %}
https://github.com/cisco/libsrtp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d123dcff5c56d4f1a9006f2b311ea99a85016cbf3bb24b1007885d422237db85
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
