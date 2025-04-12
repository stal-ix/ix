{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libsrtp
{% endblock %}

{% block version %}
1.6.0
{% endblock %}

{% block fetch %}
https://github.com/cisco/libsrtp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:1a3e7904354d55e45b3c5c024ec0eab1b8fa76fdbf4dd2ea2625dad2b3c6edde
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
