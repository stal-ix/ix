{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
alsa-lib
{% endblock %}

{% block version %}
1.2.16.1
{% endblock %}

{% block conf_ver %}2/72{% endblock %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-{{self.version().strip()}}.tar.bz2
f740db7f488255944ffd4428416ee3390a96742856916433df468c281436480e
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
