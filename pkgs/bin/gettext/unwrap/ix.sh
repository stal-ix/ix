{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block purge_autohell %}configure{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/iconv
lib/xml/2
lib/shim/gnu
lib/unistring
lib/textstyle
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/byacc
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-tools
{% endblock %}

{% block configure_flags %}
--with-installed-libtextstyle
{% endblock %}

{% block patch %}
>../gettext-runtime/intl/localealias.c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s xgettext gettext
{% endblock %}
