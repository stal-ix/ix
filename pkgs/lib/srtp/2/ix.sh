{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsrtp
{% endblock %}

{% block version %}
2.8.2
{% endblock %}

{% block fetch %}
https://github.com/cisco/libsrtp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
02e8326e12381e27a205ded888a803c6ff55ec7be170cd5e5506251f731fee92
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
