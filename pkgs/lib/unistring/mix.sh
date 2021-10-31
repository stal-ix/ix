{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz
# md5 db08bb384e81968957f997ec9808926e
{% endblock %}

{% block deps %}
# lib lib/iconv/mix.sh
# bld env/c/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dlocale_charset=unistring_locale_charset ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-libunistring-prefix=${out} \${COFLAGS}"
{% endblock %}
