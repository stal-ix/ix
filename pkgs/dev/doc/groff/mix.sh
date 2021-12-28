{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz
08fb04335e2f5e73f23ea4c3adbf0c5f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/uchardet
{% endblock %}

{% block bld_tool %}
dev/tool/perl
dev/lang/bison/3/7
dev/doc/texinfo
{% endblock %}

{% block patch %}
>src/libs/libgroff/new.cpp
{% endblock %}

{% block configure_flags %}
--with-uchardet=yes
{% endblock %}
