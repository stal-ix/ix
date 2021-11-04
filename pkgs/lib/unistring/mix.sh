{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz
db08bb384e81968957f997ec9808926e
{% endblock %}

{% block lib_deps %}
lib/iconv/mix.sh
{% endblock %}

{% block bld_deps %}
env/std/0/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dlocale_charset=unistring_locale_charset ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-libunistring-prefix=${out} \${COFLAGS}"
{% endblock %}
