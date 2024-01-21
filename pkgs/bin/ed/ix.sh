{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-1.20.tar.lz
sha:c6030defe6ae172f1687906d7354054c75a6a9130af319d4e73c50a91959c5a6
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
