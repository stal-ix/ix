{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
# md5 28b1cd4c94a74428723ed966c38cf479
{% endblock %}

{% block deps %}
# bld lib/iconv/package.sh
# bld lib/intl/package.sh
# bld lib/unistring/package.sh
# bld lib/xml2/package.sh
# bld lib/textstyle/package.sh
# bld dev/build/make/package.sh
# bld dev/lang/bison/3.6.4/package.sh
# bld tool/compress/minigzip/package.sh
# bld env/std/package.sh
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
