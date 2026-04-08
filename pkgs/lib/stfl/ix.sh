{% extends '//die/c/make.sh' %}

{% block pkg_name %}
stfl
{% endblock %}

{% block version %}
0.24
{% endblock %}

{% block fetch %}
https://github.com/newsboat/stfl/archive/bbb2404580e845df2556560112c8aefa27494d66.tar.gz
c5e77dd2e40e14f0e68dd08df1f21cd1378d88d5001e7c1926ceb7c4a977ab86
{% endblock %}

{% block lib_deps %}
lib/c
lib/ncurses
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
>Makefile.deps
sed -i 's|include Makefile.deps||' Makefile
sed -i 's|-lncursesw||' Makefile
sed -i 's|ncursesw/ncurses.h|ncurses.h|' stfl_internals.h
{% endblock %}

{% block cpp_defines %}
NCURSES_WIDECHAR=1
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
prefix=
libdir=lib
{% endblock %}

{% block make_target %}
libstfl.a
{% endblock %}

{% block install %}
mkdir -p ${out}/lib/pkgconfig ${out}/include
cp libstfl.a ${out}/lib/
cp stfl.h ${out}/include/
cat stfl.pc.in | sed "s|@VERSION@|{{self.version().strip()}}|;s|@PREFIX@|${out}|" > ${out}/lib/pkgconfig/stfl.pc
{% endblock %}
