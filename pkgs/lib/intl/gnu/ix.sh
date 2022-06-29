{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
md5:28b1cd4c94a74428723ed966c38cf479
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
