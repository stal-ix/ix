{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block purge_autohell %}configure{% endblock %}

{% block bld_libs %}
lib/c
lib/xml2
lib/iconv
lib/unistring
lib/textstyle
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/byacc
{% endblock %}

{% block run_deps %}
bin/tar
bin/gzip
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-tools
{% endblock %}

{% block configure_flags %}
--with-installed-libtextstyle
{% endblock %}
