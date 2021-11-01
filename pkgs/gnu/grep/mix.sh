{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz
# md5 f47fe27049510b2249dba7f862ac1b51
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
lib/sigsegv/mix.sh
env/c/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}
