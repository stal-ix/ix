{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
vlc
{% endblock %}

{% block version %}
3.0.17.3
{% endblock %}

{# configure: error: VLC is based on plugins. Shared libraries cannot be disabled. #}

{% block fetch %}
http://get.videolan.org/vlc/{{self.version().strip()}}/vlc-{{self.version().strip()}}.tar.xz
6f7e90ef8973d31d96de64db817173e345150829717a94084b1bb8321cde2014
{% endblock %}

{% block bld_libs %}
lib/c
lib/a52
lib/mad
lib/xml/2
lib/faad2
lib/mpeg2
lib/gnutls
lib/secret
lib/fribidi
lib/archive
lib/wayland
lib/ffmpeg/4
lib/matroska
lib/freetype
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
