{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/dosbox-staging/dosbox-staging/archive/refs/tags/v0.81.2.tar.gz
sha:6676a3b6957c144a80ca8c3ffec2a0bec0320274382f23af9c57dd1c20b2eb1b
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
{% endblock %}
