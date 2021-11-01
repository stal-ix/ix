{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
# md5 78ad9937e4caadcba1526ef1853730d5
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
env/c/mix.sh
boot/final/env/bison/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}
