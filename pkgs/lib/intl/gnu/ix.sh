{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
{% include '//bin/gettext/unwrap/ver.sh' %}
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

{% block env %}
export COFLAGS="--with-libintl-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block touch_yl %}
{% endblock %}
