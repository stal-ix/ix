{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/emacs/emacs-27.2.tar.xz
# md5 4c3d9ff35b2ab2fe518dc7eb3951e128
{% endblock %}

{% block deps %}
# bld lib/z lib/ncurses dev/build/make dev/build/pkg-config tool/text/gnu/patch tool/gnu/tar env/std
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include 'p00.diff/base64' %}
EOF
{% endblock %}

{% block coflags %}
--without-all
--without-x
--with-dumping=pdumper
--without-ns
{% endblock %}
