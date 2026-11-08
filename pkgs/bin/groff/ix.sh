{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
groff
{% endblock %}

{% block version %}
1.25.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/groff/groff-{{self.version().strip()}}.tar.gz
24d103a07eb79e418963bce206c8771b649871f83bda2fd4c2e65529c1c56921
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
