{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/joncampbell123/dosbox-x/archive/refs/tags/dosbox-x-v2024.10.01.tar.gz
sha:9940662759b9910e3c4549216be8db0278ceaaa80ace5b19f87b04d0b6ff8a3a
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

{% block cpp_includes %}
${PWD}/include
{% endblock %}

{% block patch %}
sed -e 's|return NULL;|return 0;|' -i src/dos/dos_programs.cpp
{% endblock %}
