{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-28.1.tar.gz
sha:a0236a44946fdb67b037041b354ea1aa6657f04067f17fbbe16dd2e09babc843
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
