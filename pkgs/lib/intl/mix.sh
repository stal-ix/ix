{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block lib_deps %}
lib/iconv/mix.sh
{{'sys/framework/CoreFoundation/mix.sh' | darwin}}
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-runtime
{% endblock %}

{% block setup %}
export CPPFLAGS="-Dlocale_charset=intl_locale_charset ${CPPFLAGS}"
{% endblock %}

{% block coflags %}
--with-included-gettext
--enable-relocatable
--disable-c++
--disable-libasprintf
{% endblock %}

{% block env %}
export COFLAGS="--with-libintl-prefix=${out} \${COFLAGS}"
{% endblock %}
