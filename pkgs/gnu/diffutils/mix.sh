{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz
# md5 4824adc0e95dbbf11dfbdfaad6a1e461
{% endblock %}

{% block deps %}
# bld lib/intl/mix.sh
# bld lib/iconv/mix.sh
# bld lib/sigsegv/mix.sh
# bld env/c/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block postconf %}
echo 'all install:' > man/Makefile
{% endblock %}
