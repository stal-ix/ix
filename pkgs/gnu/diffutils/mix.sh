{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz
# md5 4824adc0e95dbbf11dfbdfaad6a1e461
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
lib/sigsegv/mix.sh
env/c/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}

{% block postconf %}
echo 'all install:' > man/Makefile
{% endblock %}
