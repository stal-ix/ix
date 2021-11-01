{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://libbsd.freedesktop.org/releases/libbsd-0.11.2.tar.xz
# md5 ec16d126e5f72362d57e0161460fce5e
{% endblock %}

{% block lib_deps %}
lib/md/mix.sh
{% endblock %}

{% block bld_deps %}
lib/linux/mix.sh
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dreallocarray=bsd_reallocarray -I.. -isystem ../include/bsd/ ${CPPFLAGS}"
{% endblock %}
