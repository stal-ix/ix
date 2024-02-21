{% extends '//bin/gettext/unwrap/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/iconv
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/fake/er(tool_name=gettext)
bld/fake/er(tool_name=xgettext)
bld/fake/er(tool_name=msgfmt)
bld/fake/er(tool_name=msgmerge)
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-runtime
{% endblock %}

{% block autoreconf %}
{{super()}}
cd intl
automake --add-missing
{% endblock %}

{% block c_rename_symbol %}
locale_charset
{% endblock %}

{% block configure_flags %}
--enable-relocatable
--disable-nls
{% endblock %}

{% block env %}
export COFLAGS="--with-libintl-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block touch_yl %}
{% endblock %}

{% block patch %}
{{super()}}
# WASI fix
sed -e 's|SUBDIRS = .*|SUBDIRS = intl po|' -i Makefile.am
{% endblock %}
