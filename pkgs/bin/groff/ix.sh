{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
groff
{% endblock %}

{% block version %}
1.24.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/groff/groff-{{self.version().strip()}}.tar.gz
f9c1efd5bebbe37fc6e1063db7473ce8df1e3e0be4ff0f43ce04fce57e9c5dd9
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
