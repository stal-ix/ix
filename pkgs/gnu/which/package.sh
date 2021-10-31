{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/which/which-2.21.tar.gz
# md5 097ff1a324ae02e0a3b0369f07a7544a
{% endblock %}

{% block deps %}
# bld lib/intl/package.sh
# bld lib/iconv/package.sh
# bld env/c/package.sh
# bld boot/final/env/tools/package.sh
{% endblock %}
