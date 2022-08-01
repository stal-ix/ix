{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include '//lib/rsvg/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/rsvg
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block build %}
>config.h

cc -c -o plugin.o \
   -Dfill_info=svg_fill_info \
   -Dfill_vtable=svg_fill_vtable \
   -DGDK_PIXBUF_ENABLE_BACKEND \
   -DG_LOG_DOMAIN=\"libpixbufloader-svg\" \
   -iquote . \
   -I${lib_rsvg}/include/librsvg-2.0/librsvg \
   $(pkg-config --cflags librsvg-2.0) \
   gdk-pixbuf-loader/io-svg.c

ar q librsvgplugin.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}
