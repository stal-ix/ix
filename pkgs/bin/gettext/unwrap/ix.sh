{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
sha:c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12
{% endblock %}

{% block purge_autohell %}configure{% endblock %}

{% block bld_libs %}
lib/c
lib/xml/2
lib/iconv
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
