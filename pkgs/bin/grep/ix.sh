{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/grep/grep-3.8.tar.xz
sha:498d7cc1b4fb081904d87343febb73475cf771e424fb7e6141aff66013abc382
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
