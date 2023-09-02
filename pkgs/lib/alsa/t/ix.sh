{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.10.tar.bz2
sha:c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e
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
