{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/diffutils/diffutils-3.11.tar.xz
sha:a73ef05fe37dd585f7d87068e4a0639760419f810138bd75c61ddaa1f9e2131e
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
