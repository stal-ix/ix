{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
# md5 28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block deps %}
# bld lib/iconv/mix.sh
# bld lib/intl/mix.sh
# bld lib/unistring/mix.sh
# bld lib/xml2/mix.sh
# bld lib/textstyle/mix.sh
# bld dev/build/make/mix.sh
# bld dev/lang/bison/3.6.4/mix.sh
# bld tool/compress/minigzip/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block postunpack %}
cd gettext-tools
{% endblock %}

{% block coflags %}
--with-installed-libtextstyle
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}
