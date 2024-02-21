{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
lib/iconv
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/gperf
bld/bison
bld/gettext
{% endblock %}

{% block patch %}
{{super()}}
# WASI fix
sed -e 's|SUBDIRS = .*|SUBDIRS = intl po|' -i Makefile.am
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-included-gettext
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

{% block env %}
export COFLAGS="--with-libintl-prefix=${out} \${COFLAGS}"
{% endblock %}
