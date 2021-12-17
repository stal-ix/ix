{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libbsd-0.11.2.tar.xz
ec16d126e5f72362d57e0161460fce5e
{% endblock %}

{% block lib_deps %}
lib/md/mix.sh
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/linux/mix.sh
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block setup %}
export CPPFLAGS="-I.. -isystem ../include/bsd/ ${CPPFLAGS}"
{% endblock %}
