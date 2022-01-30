{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libbsd-0.11.2.tar.xz
ec16d126e5f72362d57e0161460fce5e
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
