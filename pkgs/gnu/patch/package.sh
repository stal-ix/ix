{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
# md5 78ad9937e4caadcba1526ef1853730d5
{% endblock %}

{% block deps %}
# bld lib/intl/package.sh
# bld lib/iconv/package.sh
# bld env/c/package.sh
# bld boot/final/env/bison/package.sh
# bld boot/final/env/tools/package.sh
{% endblock %}
