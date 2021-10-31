{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
# md5 78ad9937e4caadcba1526ef1853730d5
{% endblock %}

{% block deps %}
# bld lib/intl/mix.sh
# bld lib/iconv/mix.sh
# bld env/c/mix.sh
# bld boot/final/env/bison/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}
