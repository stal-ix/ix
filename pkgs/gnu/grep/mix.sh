{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz
# md5 f47fe27049510b2249dba7f862ac1b51
{% endblock %}

{% block deps %}
# bld lib/intl/mix.sh
# bld lib/iconv/mix.sh
# bld lib/sigsegv/mix.sh
# bld env/c/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}
