{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dosbox-staging
{% endblock %}

{% block version %}
0.82.2
{% endblock %}

{% block fetch %}
https://github.com/dosbox-staging/dosbox-staging/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:d84c87e4b6ec3bdaac126c6354a5d2a94429987c55afbe76d0cb4536bae98428
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/png
lib/munt
lib/tracy
lib/slirp
lib/iir/1
lib/sdl/2
lib/expat
lib/kernel
lib/sdl/deps
lib/sdl/2/net
lib/opus/file
lib/fluid/synth
lib/xiph/speex/dsp
{% if opengl %}
lib/opengl
lib/shim/fake(lib_name=GL)
{% endif %}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_flags %}
use_alsa=false
use_zlib_ng=false
{% if opengl %}
use_opengl=true
{% else %}
use_opengl=false
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}
