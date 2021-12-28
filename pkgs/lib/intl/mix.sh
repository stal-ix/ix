{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv

{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block std_box %}
box/boot
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

{% block env %}
export COFLAGS="--with-libintl-prefix=${out} \${COFLAGS}"
{% endblock %}
