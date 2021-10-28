{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://libbsd.freedesktop.org/releases/libbsd-0.11.2.tar.xz
# md5 ec16d126e5f72362d57e0161460fce5e
{% endblock %}

{% block deps %}
# lib lib/md
# bld lib/linux dev/build/make env/std
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dreallocarray=bsd_reallocarray -I.. -isystem ../include/bsd/ ${CPPFLAGS}"
{% endblock %}
