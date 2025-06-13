{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmpeg2
{% endblock %}

{% block version %}
0.5.1
{% endblock %}

{% block fetch %}
https://libmpeg2.sourceforge.io/files/libmpeg2-{{self.version().strip()}}.tar.gz
dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7ce8f3b61851871d4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
