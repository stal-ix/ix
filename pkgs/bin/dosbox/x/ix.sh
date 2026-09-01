{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
dosbox-x
{% endblock %}

{% block version %}
2026.08.31
{% endblock %}

{% block fetch %}
https://github.com/joncampbell123/dosbox-x/archive/refs/tags/dosbox-x-v{{self.version().strip()}}.tar.gz
992ea538ea858f9fb196b39de2276ce3048c731965e144e6288202abed109782
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/png
lib/pcap
lib/sdl/2
lib/slirp
lib/curses
lib/kernel
lib/sdl/deps
lib/sdl/2/net
lib/fluid/synth
{% endblock %}

{% block shell %}
bld/nasm
bin/bash/lite/sh
{% endblock %}

{% block configure_flags %}
--disable-x11
--disable-sdl2test
--enable-sdl2
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_missing %}
unistd.h
fcntl.h
{% endblock %}

{% block patch %}
sed -e 's|return NULL;|return 0;|' -i src/dos/dos_programs.cpp
{% endblock %}
