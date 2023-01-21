{% extends '//die/c/make.sh' %}

{% block fetch %}
http://downloads.sourceforge.net/freeimage/FreeImage3180.zip
sha:f41379682f9ada94ea7b34fe86bf9ee00935a3147be41b6569c9605a53e438fd
https://github.com/archlinux/svntogit-community/archive/515367ae9616cb3fa53eaf041634dd6e0637a774.tar.gz
sha:a09027386b523124e63a671218007004c0a6c0720857445a6bae0b5c5b980466
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/jxr
lib/raw
lib/jxl
lib/c++
lib/png
lib/tiff
lib/webp
lib/jpeg
lib/openexr
lib/jbig2dec
lib/jpeg/open
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 1 ${src}/F*
extract 1 ${src}/5*
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
INCDIR=${out}/include
INSTALLDIR=${out}/lib
{% endblock %}

{% block patch %}
patch -p1 < trunk/freeimage-unbundle.patch
rm -r Source/Lib* Source/ZLib Source/OpenEXR
>Source/FreeImage/PluginG3.cpp
>Source/FreeImageToolkit/JPEGTransform.cpp
patch -p1 < trunk/freeimage-libraw-0.20.patch
patch -p1 < trunk/freeimage-libraw-0.21.patch
sed -e 's|return NULL;|return 0;|' -i Source/FreeImage/PluginPSD.cpp
sed -e 's|-o root -g root||' -i Makefile.gnu
{% endblock %}

{% block build %}
sh gensrclist.sh
{{super()}}
{% endblock %}
