{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block bld_deps %}
lib/iconv/mix.sh
lib/intl/mix.sh
lib/unistring/mix.sh
lib/xml2/mix.sh
lib/textstyle/mix.sh
dev/lang/bison/3.6.4/mix.sh
tool/compress/minigzip/mix.sh
{{super()}}
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-tools
{% endblock %}

{% block coflags %}
--with-installed-libtextstyle
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib ${out}/include
{% endblock %}
