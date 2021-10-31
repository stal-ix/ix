{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
# md5 aeb29c6a90350a4c959cd1df38cd0a7e
{% endblock %}

{% block deps %}
# lib lib/intl/mix.sh
# lib lib/iconv/mix.sh
# bld lib/readline/mix.sh
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
# bld boot/final/env/bison/mix.sh
{% endblock %}

{% block coflags %}
--enable-libgdbm-compat
--with-readline
{% endblock %}

{% block postinstall %}
cd ${out}/lib && ln -s libgdbm_compat.a libdbm.a
{% endblock %}

{% block env %}
export COFLAGS="--with-gdbm=${out} \${COFLAGS}"
{% endblock %}
