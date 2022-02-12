{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz
4824adc0e95dbbf11dfbdfaad6a1e461
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/iconv
lib/sigsegv
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}
