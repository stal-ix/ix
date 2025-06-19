{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
vim
{% endblock %}

{% block version %}
9.1.1471
{% endblock %}

{% block fetch %}
https://github.com/vim/vim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0bfd33f8a81e3b1ff0fa533d65c5ed23f331b41e1befc768fff9c85b1d4daa65
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block autoreconf %}
autoconf
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/curses
{% endblock %}

{% block configure_flags %}
--with-features=huge
--with-compiledby='MIX'
--enable-acl
--disable-gui
--enable-multibyte
--enable-cscope
{% endblock %}
