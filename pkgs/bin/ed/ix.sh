{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-1.20.1.tar.lz
sha:b1a463b297a141f9876c4b1fcd01477f645cded92168090e9a35db2af4babbca
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
