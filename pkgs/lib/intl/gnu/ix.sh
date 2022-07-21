{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
sha:c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv

{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-runtime
{% endblock %}

{% block c_rename_symbol %}
locale_charset
{% endblock %}

{% block configure_flags %}
--with-included-gettext
--enable-relocatable
--disable-c++
--disable-libasprintf
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libintl-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block touch_yl %}
{% endblock %}
