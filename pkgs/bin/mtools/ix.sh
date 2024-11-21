{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-4.0.46.tar.lz
sha:8241b370d2337968c1d1314cbdbd5d5d188ddc905f2eb1198373a2bd90c70fab
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
