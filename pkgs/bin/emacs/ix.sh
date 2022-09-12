{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-28.2.tar.gz
sha:ec15e87fa5a6f1edd66814d8684d9e952570c699d5b49ccf1d469ae638b82634
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
