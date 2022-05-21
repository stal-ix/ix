{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/vim/vim/archive/refs/tags/v8.2.4701.tar.gz
sha:25b1deb928d80080d8ebc19913dfb27ac8b17e0e961ccb56bc9216e0104426d9
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
