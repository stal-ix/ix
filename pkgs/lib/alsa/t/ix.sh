{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.8.tar.bz2
sha:1ab01b74e33425ca99c2e36c0844fd6888273193bd898240fe8f93accbcbf347
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
