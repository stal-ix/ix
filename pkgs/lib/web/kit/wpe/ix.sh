{% extends '//lib/web/kit/t/ix.sh' %}

{% block fetch %}
https://wpewebkit.org/releases/wpewebkit-2.36.2.tar.xz
sha:959519562701e2005f2767a62e85977d6c3e65858709b376c89d8e33502febb9
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/atk
lib/c++
lib/wpe
lib/icu
lib/png
lib/avif
lib/xml/2
lib/glib
lib/jpeg
lib/webp
lib/xslt
lib/woff2
lib/epoxy
lib/cairo
lib/tasn1
lib/gcrypt
lib/soup/3
lib/lcms/2
lib/sqlite/3
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
ENABLE_ACCESSIBILITY=OFF
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
