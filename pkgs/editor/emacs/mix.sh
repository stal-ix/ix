{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/emacs/emacs-27.2.tar.xz
# md5 4c3d9ff35b2ab2fe518dc7eb3951e128
{% endblock %}

{% block deps %}
# bld lib/z/mix.sh
# bld lib/curses/any/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld gnu/patch/mix.sh
# bld gnu/tar/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block patch %}
patch -p1 << EOF
{% include 'p00.diff' %}
EOF
{% endblock %}

{% block coflags %}
--without-all
--without-x
--with-dumping=pdumper
--without-ns
{% endblock %}
