{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.12.tar.bz2
sha:4868cd908627279da5a634f468701625be8cc251d84262c7e5b6a218391ad0d2
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
