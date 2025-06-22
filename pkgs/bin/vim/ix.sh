{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
vim
{% endblock %}

{% block version %}
9.1.1473
{% endblock %}

{% block fetch %}
https://github.com/vim/vim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8528a6c69401e16245b2dcf320f1f46e6130d53ab4042fd1e43eaca3291ff622
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
