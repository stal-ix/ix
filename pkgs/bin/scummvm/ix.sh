{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
scummvm
{% endblock %}

{% block version %}
2.9.0
{% endblock %}

{% block fetch %}
https://downloads.scummvm.org/frs/scummvm/{{self.version().strip()}}/scummvm-{{self.version().strip()}}.tar.xz
d5b33532bd70d247f09127719c670b4b935810f53ebb6b7b6eafacaa5da99452
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/a52
lib/c++
lib/png
lib/mad
lib/gif
lib/curl
lib/jpeg
lib/faad2
lib/sdl/2
lib/mpeg2
lib/fribidi
lib/sdl/deps
lib/freetype
lib/timidity
lib/shim/x11
lib/xiph/ogg
lib/xiph/flac
lib/xiph/vorbis
lib/xiph/theora
{% endblock %}

{% block bld_tool %}
bld/nasm
bld/fakegit
bld/elfutils
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block c_rename_symbol %}
crc_finalize
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}
--enable-static
--opengl-mode=gles2
--enable-verbose-build
{% endblock %}
