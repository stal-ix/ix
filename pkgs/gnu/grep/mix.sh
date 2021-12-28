{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz
f47fe27049510b2249dba7f862ac1b51
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/iconv
lib/sigsegv
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}
