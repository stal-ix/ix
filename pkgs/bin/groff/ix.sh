{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
groff
{% endblock %}

{% block version %}
1.24.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/groff/groff-{{self.version().strip()}}.tar.gz
74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7df8ba4c7b41e7cfd8
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/uchardet
{% endblock %}

{% block bld_tool %}
bld/perl
bld/bison
bld/texinfo
{% endblock %}

{% block patch %}
>src/libs/libgroff/new.cpp
{% endblock %}

{% block configure_flags %}
--with-uchardet=yes
{% endblock %}

{% block c_flags %}
-Wno-register
{% endblock %}
