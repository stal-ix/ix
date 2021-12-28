{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/emacs/emacs-27.2.tar.xz
4c3d9ff35b2ab2fe518dc7eb3951e128
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/curses
{% endblock %}

{% block bld_tool %}
gnu/patch
gnu/tar
{% endblock %}

{% block patch %}
patch -p1 << EOF
{% include 'p00.diff' %}
EOF
{% endblock %}

{% block configure_flags %}
--without-all
--without-x
--with-dumping=pdumper
--without-ns
{% endblock %}
