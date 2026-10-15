{# the magick CLI with the decoder set of the wasm build and nothing else:
   no pango, fonts, heif, raw or openexr. What bld/magick builds when the
   system has no magick to wrap. #}

{% extends '//lib/image/magick/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/png
lib/jpeg
lib/webp
lib/tiff
lib/lcms/2
lib/jpeg/open
{% endblock %}

{% block configure_flags %}
--with-jxl=yes
--with-utilities
--without-heic
--without-raw
--without-openexr
--without-pango
--without-x
--without-fontconfig
--without-freetype
--without-magick-plus-plus
{% endblock %}
