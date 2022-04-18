{% extends '//lib/web/kit/t/mix.sh' %}

{% block fetch %}
https://wpewebkit.org/releases/wpewebkit-2.36.0.tar.xz
sha:096aa9f87d9bfbfc80f558388a86721cdcc508b42ddef10bd270aec9aee96d5a
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/atk
lib/c++
lib/wpe
lib/icu
lib/png
lib/xml2
lib/glib
lib/jpeg
lib/webp
lib/xslt
lib/lcms2
lib/woff2
lib/epoxy
lib/cairo
lib/tasn1
lib/gcrypt
lib/soup/3
lib/sqlite3
lib/freetype
lib/harfbuzz
lib/jpeg/open
lib/gstreamer
lib/fontconfig
lib/harfbuzz/icu

lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/gstreamer/dl
lib/mesa/glesv2/dl
lib/glib/networking
{% endblock %}

{% block cmake_flags %}
{{super()}}
PORT=WPE
{% endblock %}

{% block setup %}
{{super()}}
mkdir -p inc/EGL
cp ${lib_mesa}/include/EGL/eglplatform.h inc/EGL/
cp -R ${lib_mesa}/include/KHR inc/
export CPPFLAGS="-I${PWD}/inc ${CPPFLAGS}"
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
for x in *.so; do
    cp ${x} $(echo ${x} | sed -e 's|.so|.a|')
done
{% endblock %}
