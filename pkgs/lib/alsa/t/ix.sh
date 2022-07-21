{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.7.2.tar.bz2
sha:8a35b7218e50f2a2c79342d0de98ded81439ce19e12809385ec9be9596de7c2f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block configure_flags %}
--with-libdl
{% endblock %}
