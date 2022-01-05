{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block bld_libs %}
lib/c
lib/xml2
lib/iconv
lib/unistring
lib/textstyle
{% endblock %}

{% block bld_tool %}
dev/lang/bison/3/6
tool/compress/gzip
{% endblock %}

{% block run_deps %}
gnu/tar
tool/compress/gzip
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-tools
{% endblock %}

{% block configure_flags %}
--with-installed-libtextstyle
{% endblock %}
