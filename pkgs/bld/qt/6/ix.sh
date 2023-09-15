{% extends '//lib/qt/6/base/t/ix.sh' %}

{% block bld_libs %}
lib/kernel
lib/pcre/2
{{super()}}
{% endblock %}

{% block qt_codegen %}
bld/perl
{% endblock %}

{% block cmake_flags %}
INSTALL_LIBEXECDIR=bin
QT_FEATURE_glib=OFF
QT_FEATURE_icu=OFF
QT_FEATURE_qmake=ON
QT_FEATURE_sql=OFF
QT_FEATURE_gui=OFF
QT_FEATURE_widgets=OFF
QT_FEATURE_opengl=OFF
QT_FEATURE_testlib=OFF
QT_FEATURE_printsupport=OFF
QT_FEATURE_reduce_relocations=OFF
QT_FEATURE_static_runtime=ON
QT_FEATURE_static=ON
QT_FEATURE_shared=OFF
{% endblock %}

{% block env %}
export QT_HOST_PATH=${out}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|error(|message(|' -i mkspecs/features/toolchain.prf
{% endblock %}

{% block postinstall %}
cd ${out}
mv lib old
mkdir -p lib/cmake
mv old/cmake/*Tools old/cmake/Qt6HostInfo lib/cmake/
rm -rf doc include plugins modules old
{% endblock %}
