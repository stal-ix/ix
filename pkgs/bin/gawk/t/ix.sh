{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gawk/gawk-5.1.1.tar.xz
sha:d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block c_rename_symbol %}
err
regcomp
regfree
xmalloc
xrealloc
{% endblock %}

{% block configure_flags %}
--disable-extensions
{% endblock %}
