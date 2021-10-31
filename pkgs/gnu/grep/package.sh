{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz
# md5 f47fe27049510b2249dba7f862ac1b51
{% endblock %}

{% block deps %}
# bld lib/intl/package.sh
# bld lib/iconv/package.sh
# bld lib/sigsegv/package.sh
# bld env/c/package.sh
# bld boot/final/env/tools/package.sh
{% endblock %}
