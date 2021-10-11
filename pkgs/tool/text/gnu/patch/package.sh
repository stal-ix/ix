{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
# md5 78ad9937e4caadcba1526ef1853730d5
{% endblock %}

{% block deps %}
# bld lib/intl lib/iconv env/c boot/final/env/tools
{% endblock %}
