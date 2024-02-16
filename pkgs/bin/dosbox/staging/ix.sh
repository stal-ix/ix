{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/dosbox-staging/dosbox-staging/archive/refs/tags/v0.81.0.tar.gz
sha:9b133dbf2fe8410bb475267a8f26844d56b9025079783ec6a4574841888ae600
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/png
lib/munt
lib/alsa
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
