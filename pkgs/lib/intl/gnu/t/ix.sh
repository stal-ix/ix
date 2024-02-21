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

{% block autoreconf %}
{{super()}}
cd intl
automake --add-missing
{% endblock %}

{% block c_rename_symbol %}
locale_charset
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-relocatable
{% endblock %}

{% block env %}
export COFLAGS="--with-libintl-prefix=${out} \${COFLAGS}"
{% endblock %}
