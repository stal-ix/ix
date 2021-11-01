{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/which/which-2.21.tar.gz
# md5 097ff1a324ae02e0a3b0369f07a7544a
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
env/c/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}
