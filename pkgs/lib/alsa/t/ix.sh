{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
alsa-lib
{% endblock %}

{% block version %}
1.2.15.1
{% endblock %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-{{self.version().strip()}}.tar.bz2
7f983ca89ca420872ca16e8a9f8f97fb63db6c1c6e2585b91737a08bb03f566c
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
