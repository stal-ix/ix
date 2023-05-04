{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.9.tar.bz2
sha:dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block configure_flags %}
--with-libdl
{% endblock %}
