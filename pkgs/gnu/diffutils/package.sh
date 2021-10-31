{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz
# md5 4824adc0e95dbbf11dfbdfaad6a1e461
{% endblock %}

{% block deps %}
# bld lib/intl/package.sh
# bld lib/iconv/package.sh
# bld lib/sigsegv/package.sh
# bld env/c/package.sh
# bld boot/final/env/tools/package.sh
{% endblock %}

{% block postconf %}
echo 'all install:' > man/Makefile
{% endblock %}
