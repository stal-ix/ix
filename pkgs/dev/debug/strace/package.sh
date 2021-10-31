{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://strace.io/files/5.14/strace-5.14.tar.xz
# md5 36c1c17f31855617b7898d2fd5abb9e2
{% endblock %}

{% block deps %}
# bld lib/linux/package.sh
# bld lib/elfutils/package.sh
# bld dev/build/make/package.sh
# bld env/std/package.sh
{% endblock %}

{% block coflags %}
--enable-mpers=no
--with-libdw
{% endblock %}
