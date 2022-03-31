{% extends '//mix/make.sh' %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-1.19.0-source.tar.xz
sha:38f39943e408d60a3e7d6c2fca0d705163540ca24d65682d4426dc6f1fee28c5
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/jpeg
lib/curl
lib/freetype
lib/harfbuzz
lib/jpeg/open
{% endblock %}

{% block bld_tool %}
bin/binutils(for_target={{target.gnu.three}})
bin/pkg-config
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block make_flags %}
USE_SYSTEM_FREETYPE=yes
USE_SYSTEM_GUMBO=no
USE_SYSTEM_HARFBUZZ=yes
USE_SYSTEM_JBIG2DEC=no
USE_SYSTEM_JPEGXR=no
USE_SYSTEM_LCMS2=no
USE_SYSTEM_LIBJPEG=yes
USE_SYSTEM_MUJS=no
USE_SYSTEM_OPENJPEG=yes
USE_SYSTEM_ZLIB=yes
USE_SYSTEM_GLUT=yes
USE_SYSTEM_CURL=yes
USE_SYSTEM_LEPTONICA=no
USE_SYSTEM_TESSERACT=no
{% endblock %}

{% block setup %}
export LD=ld
{% endblock %}
