{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libbsd-0.11.5.tar.xz
sha:1a9c952525635c1bb6770cb22e969b938d8e6a9d7912362b98ee8370599b0efd
{% endblock %}

{% block lib_deps %}
lib/c
lib/md
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block setup %}
export CPPFLAGS="-I.. -isystem ../include/bsd ${CPPFLAGS}"
{% endblock %}
