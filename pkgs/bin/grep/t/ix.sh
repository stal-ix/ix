{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/grep/grep-3.10.tar.xz
sha:24efa5b595fb5a7100879b51b8868a0bb87a71c183d02c4c602633b88af6855b
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
