{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.7.1.tar.bz2
sha:046dc42dfcfad269217be05954686137e5e7397f3041372f8c6dcd7d79461e61
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
