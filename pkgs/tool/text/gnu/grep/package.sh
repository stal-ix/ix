{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz
# md5 f47fe27049510b2249dba7f862ac1b51
{% endblock %}

{% block deps %}
# bld lib/intl lib/iconv lib/sigsegv env/c boot/final/env/tools
{% endblock %}
