{% extends 'cmake.sh' %}

{% block std_box %}
{% block qt_codegen %}
bld/qt/6
bld/perl
{% endblock %}
{{super()}}
{% endblock %}

{% block cmake_flags %}
QT_BUILD_EXAMPLES=OFF
QT_BUILD_TESTS=OFF
INSTALL_LIBEXECDIR=bin
{% if tool %}
QT_FORCE_FIND_TOOLS=OFF
QT_FORCE_BUILD_TOOLS=ON
QT_WILL_BUILD_TOOLS=ON
QT_BUILD_TOOLS_WHEN_CROSSCOMPILING=ON
QT_FEATURE_cross_compile=OFF
{% else %}
QT_FORCE_FIND_TOOLS=ON
QT_FORCE_BUILD_TOOLS=OFF
QT_WILL_BUILD_TOOLS=OFF
QT_BUILD_TOOLS_WHEN_CROSSCOMPILING=OFF
QT_FEATURE_cross_compile=ON
{% endif %}
{% endblock %}

{% block postinstall %}
find ${out}/plugins/ -type f -name '*.a' | while read l; do
    cp ${l} ${out}/lib/
done
{% endblock %}

{% block functions %}
{{super()}}

qt_cm_flags() (
    env | grep '_DIR=' | grep 'Qt6' | while read l; do
        echo -n "-D${l} "
    done
)
{% endblock %}

{% block configure %}
CMFLAGS="$(qt_cm_flags) ${CMFLAGS}"
{{super()}}
{% endblock %}
