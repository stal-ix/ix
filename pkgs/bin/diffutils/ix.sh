{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/diffutils/diffutils-3.9.tar.xz
sha:d80d3be90a201868de83d78dad3413ad88160cc53bcc36eb9eaf7c20dbf023f1
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
