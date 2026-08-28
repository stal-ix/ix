{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dosbox-staging
{% endblock %}

{% block version %}
0.83.0
{% endblock %}

{% block fetch %}
https://github.com/dosbox-staging/dosbox-staging/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9b36be5a666784adaeffa560bd0950691f851a76bdb97e7ae3c989561e91caf3
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/asio
lib/png
lib/munt
lib/tracy
lib/slirp
lib/iir/1
lib/sdl/2
lib/sdl/2/image
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
wrap_rdynamic
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

{% block patch %}
sed -e "/'misc',/d" -i resources/shaders/meson.build
sed -e "/src\/libs\/residfp/a subdir('src/libs/riffcpp')" -i meson.build
sed -e '/^libriffcpp =/i )' -i src/libs/riffcpp/meson.build
sed -e 's|libriffcpp,|libriffcpp_dep,|' -i src/hardware/meson.build
sed -e "/'midi.cpp',/a \\    'midi_synth.cpp'," -i src/midi/meson.build
sed -e 's|@version@|{{self.version().strip()}}|' \
    -e '/#define DOSBOX_VERSION "/a #define DOSBOX_VERSION_SHORT "{{self.version().strip().split(".")[0]}}.{{self.version().strip().split(".")[1]}}"' \
    -i src/dosbox_config.h.in
{% endblock %}
