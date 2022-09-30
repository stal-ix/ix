{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtbase/archive/refs/tags/v6.4.0.tar.gz
sha:fbc462816bf5b87d521e9f69cebe0ce331de2258396e0932fa580283f07fce0c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/double/conversion
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_reduce_relocations=OFF
QT_FEATURE_static_runtime=ON
QT_FEATURE_static=ON
QT_FEATURE_shared=OFF
QT_FEATURE_doubleconversion=ON
QT_FEATURE_freetype=ON
QT_FEATURE_harfbuzz=ON
QT_FEATURE_jpeg=ON
QT_FEATURE_largefile=ON
QT_FEATURE_png=ON
QT_FEATURE_fontconfig=ON

QT_FEATURE_posix_fallocate=ON
QT_FEATURE_regularexpression=ON
QT_FEATURE_system_doubleconversion=ON
QT_FEATURE_system_freetype=ON
QT_FEATURE_system_harfbuzz=ON
QT_FEATURE_system_jpeg=ON
QT_FEATURE_system_libb2=ON
QT_FEATURE_system_pcre2=ON
QT_FEATURE_system_sqlite=ON
QT_FEATURE_system_zlib=ON
QT_FEATURE_system_fontconfig=ON
QT_FEATURE_systemsemaphore=ON

#QT_FEATURE_system_proxies
#QT_FEATURE_system_textmarkdownreader
#QT_FEATURE_systemtrayicon
#QT_FEATURE_textmarkdownreader
#QT_FEATURE_xcb
{% endblock %}
