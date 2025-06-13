{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libetpan
{% endblock %}

{% block version %}
1.9.4
{% endblock %}

{% block fetch %}
https://github.com/dinhvh/libetpan/archive/refs/tags/{{self.version().strip()}}.tar.gz
82ec8ea11d239c9967dbd1717cac09c8330a558e025b3e4dc6a7594e80d13bb1
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/gnutls
lib/gcrypt
{% endblock %}
