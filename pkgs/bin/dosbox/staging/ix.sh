{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dosbox-staging
{% endblock %}

{% block version %}
0.82.1
{% endblock %}

{% block fetch %}
https://github.com/dosbox-staging/dosbox-staging/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:311200268e2ce07c2bd684ff2d6d423b21f3e9aa90416147d418de8950120083
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
lib/opengl
lib/kernel
lib/sdl/deps
lib/sdl/2/net
lib/opus/file
lib/fluid/synth
lib/xiph/speex/dsp
lib/shim/fake(lib_name=GL)
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_flags %}
use_alsa=false
use_zlib_ng=false
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}
