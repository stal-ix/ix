{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
alsa-lib
{% endblock %}

{% block version %}
1.2.14
{% endblock %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-{{self.version().strip()}}.tar.bz2
be9c88a0b3604367dd74167a2b754a35e142f670292ae47a2fdef27a2ee97a32
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
