{% extends '//lib/intl/gnu/t/ix.sh' %}

{% block purge_autohell %}configure{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/iconv
lib/shim/gnu
lib/unistring
lib/textstyle
{% endblock %}

{% block bld_tool %}
bld/gzip
bin/gperf
bld/byacc
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-tools
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-installed-libtextstyle
{% endblock %}

{% block patch %}
>../gettext-runtime/intl/localealias.c
{% endblock %}
