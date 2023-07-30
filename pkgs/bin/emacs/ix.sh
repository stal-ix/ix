{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-29.1.tar.gz
sha:77acbd95a036b1946aff2dda2288def0fc9180d378adcbe3d5aa3f8b954fd48d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/curses
{% endblock %}

{% block purge_autohell %}configure{% endblock %}

{% block bld_tool %}
bin/gzip
bld/gettext
bld/texinfo
{% endblock %}

{% block configure_flags %}
--without-x
--without-ns
--without-all
--with-dumping=pdumper
{% endblock %}
