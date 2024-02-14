{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/diffutils/diffutils-3.10.tar.xz
sha:90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
