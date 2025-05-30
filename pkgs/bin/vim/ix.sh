{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
vim
{% endblock %}

{% block version %}
9.1.1418
{% endblock %}

{% block fetch %}
https://github.com/vim/vim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:63773eb3fc407b73b91c78c5eb6d294f13f80f6ba17aa4ae0f32324e27c6af68
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
