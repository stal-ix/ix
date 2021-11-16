{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz
f47fe27049510b2249dba7f862ac1b51
{% endblock %}

{% block bld_libs %}
lib/intl/mix.sh
lib/iconv/mix.sh
lib/sigsegv/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}
