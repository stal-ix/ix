{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
alsa-lib
{% endblock %}

{% block version %}
1.2.13
{% endblock %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-{{self.version().strip()}}.tar.bz2
sha:8c4ff37553cbe89618e187e4c779f71a9bb2a8b27b91f87ed40987cc9233d8f6
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
