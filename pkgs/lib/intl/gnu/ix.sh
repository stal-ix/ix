{% extends '//bin/gettext/unwrap/t/ix.sh' %}

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
--disable-c++
--enable-relocatable
--disable-libasprintf
--with-included-gettext
{% endblock %}

{% block env %}
export COFLAGS="--with-libintl-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block touch_yl %}
{% endblock %}

{% block patch %}
# WASI fix
sed -e 's|SUBDIRS = .*|SUBDIRS = intl po|' -i Makefile.am
{% endblock %}
