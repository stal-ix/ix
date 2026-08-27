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
