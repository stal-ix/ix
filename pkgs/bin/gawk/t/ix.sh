{% extends '//die/c/autohell.sh' %}

{% block fetch %}
#https://ftp.gnu.org/gnu/gawk/gawk-5.2.0.tar.xz
#sha:e4ddbad1c2ef10e8e815ca80208d0162d4c983e6cca16f925e8418632d639018
https://ftp.gnu.org/gnu/gawk/gawk-5.1.1.tar.xz
sha:d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block std_box %}
bld/bison
{{super()}}
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
