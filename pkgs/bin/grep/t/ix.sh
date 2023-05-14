{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/grep/grep-3.11.tar.xz
sha:1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59aecc78f5a951276eab
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
