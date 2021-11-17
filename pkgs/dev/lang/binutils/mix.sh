{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz
e78d9ff2976b745a348f4c1f27c77cb1
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/intl/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/flex/mix.sh
dev/lang/bison/3.6.4/mix.sh
{% endblock %}

{% block coflags %}
--enable-deterministic-archives
--disable-werror
--enable-interwork
--enable-64-bit-bfd
--enable-gold
--disable-plugins
--enable-targets=all
--with-system-zlib
{% endblock %}
