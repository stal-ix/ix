{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz
4824adc0e95dbbf11dfbdfaad6a1e461
{% endblock %}

{% block bld_libs %}
lib/intl/mix.sh
lib/iconv/mix.sh
lib/sigsegv/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}
