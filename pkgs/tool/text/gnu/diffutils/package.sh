{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz
# md5 4824adc0e95dbbf11dfbdfaad6a1e461
{% endblock %}

{% block deps %}
# bld lib/intl lib/iconv lib/sigsegv env/c boot/final/env/tools
{% endblock %}

{% block postconf %}
echo 'all install:' > man/Makefile
{% endblock %}
