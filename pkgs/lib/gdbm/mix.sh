{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
# md5 aeb29c6a90350a4c959cd1df38cd0a7e
{% endblock %}

{% block lib_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block bld_deps %}
lib/readline/mix.sh
env/std/0/mix.sh
boot/final/env/bison/mix.sh
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
