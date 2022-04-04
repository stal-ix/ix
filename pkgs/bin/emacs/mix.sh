{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/emacs/emacs-27.2.tar.xz
4c3d9ff35b2ab2fe518dc7eb3951e128

#https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-28.1.tar.gz
#sha:a0236a44946fdb67b037041b354ea1aa6657f04067f17fbbe16dd2e09babc843
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/curses
{% endblock %}

{% block bld_tool %}
bld/tar
{% endblock %}

{% block configure_flags %}
--without-x
--without-ns
--without-all
--with-dumping=pdumper
{% endblock %}
