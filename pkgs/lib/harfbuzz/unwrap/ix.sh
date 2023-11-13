{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/cairo/bootstrap
lib/freetype/bootstrap
lib/fontconfig/bootstrap
{% endblock %}

{% block lib_deps %}
{{super()}}
{% if darwin %}
lib/darwin/framework/CoreText
lib/darwin/framework/ApplicationServices
{% endif %}
{% endblock %}

{% block meson_flags %}
{{super()}}
icu=disabled
utilities=disabled
{% if darwin %}
coretext=enabled
{% endif %}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*GCC.*Wcast-align.*||' -i src/hb.hh
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/cmake
{#
ninja: error: '.../libharfbuzz.so.0.60810.0', needed by 'lib/libQt6UiTools.a', missing and no known rule to make it
CalledProcessError: Command '['sh', '-s']' returned non-zero exit status 1.
#}
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/harfbuzz \${CPPFLAGS}"
{% endblock %}
