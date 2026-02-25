{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
alsa-lib
{% endblock %}

{% block version %}
1.2.15.3
{% endblock %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-{{self.version().strip()}}.tar.bz2
7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block configure_flags %}
--with-libdl=no
{% endblock %}
