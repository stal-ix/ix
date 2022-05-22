{% extends '//die/make.sh' %}

{% block fetch %}
http://downloads.sourceforge.net/freeimage/FreeImage3180.zip
sha:f41379682f9ada94ea7b34fe86bf9ee00935a3147be41b6569c9605a53e438fd
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
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

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
INCDIR=${out}/include
INSTALLDIR=${out}/lib
{% endblock %}

{% block patch %}
sed -e 's|return NULL;|return 0;|' -i Source/FreeImage/PluginPSD.cpp
sed -e 's|-o root -g root||' -i Makefile.gnu
{% endblock %}
