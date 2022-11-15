{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/b2
lib/png
lib/icu
lib/dbus
lib/jpeg
lib/udev
lib/input
lib/opengl
lib/brotli
lib/pcre/2
lib/wayland
lib/openssl
lib/sqlite/3
lib/freetype
lib/harfbuzz
lib/xkbcommon
lib/fontconfig
lib/vulkan/loader
lib/vulkan/headers
lib/double/conversion
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/wayland
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_androiddeployqt=OFF
QT_FEATURE_journald=OFF
QT_FEATURE_vulkan=ON
QT_FEATURE_system_sqlite=ON
QT_FEATURE_dbus_linked=ON
QT_FEATURE_openssl_linked=ON
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
sed -e 's|cross_compile|cross_compile_xxx|g' -i cmake/Qt6Core/Qt6CoreTargets.cmake
sed -e 's|GLIB2::GLIB2|c|' -i cmake/Qt6Gui/Qt6GuiTargets.cmake
sed -e 's|GLIB2::GLIB2|c|' -i cmake/Qt6Core/Qt6CoreTargets.cmake
llvm-ar q libqtregister.a $(find -type f -name '*.o')
{% endblock %}

{% block env %}
export CMFLAGS="-DQT_DISABLE_NO_DEFAULT_PATH_IN_QT_PACKAGES=ON -DBUILD_WITH_QT6=ON \${CMFLAGS}"
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|"Sans Serif"|"system-ui"|' -i src/gui/platform/unix/qgenericunixthemes.cpp
{% endblock %}

{#
SIGSEGV with -O2
[Switching to LWP 14132]
0x0000000009f795b7 in QRgba64 const* fetchTransformedBilinear64<(TextureBlendType)4>(QRgba64*, Operator const*, QSpanData const*, int, int, int) ()
(gdb) bt
#0  0x0000000009f795b7 in QRgba64 const* fetchTransformedBilinear64<(TextureBlendType)4>(QRgba64*, Operator const*, QSpanData const*, int, int, int) ()
#1  0x0000000009f87338 in handleSpans<BlendSrcGenericRGB64>(int, QT_FT_Span_ const*, QSpanData const*, Operator const&)::{lambda(int, int)#1}::operator()(int, int) const ()
#2  0x0000000009f87444 in void std::__1::__function::__policy_invoker<void ()>::__call_impl<std::__1::__function::__default_alloc_func<handleSpans<BlendSrcGenericRGB64>(int, QT_FT_Span_ const*, QSpanData const*, Operator const&)::{lambda()#1}, void ()> >(std::__1::__function::__policy_storage const*)
    ()
    #3  0x000000000a4ce3a1 in QThreadPoolThread::run() ()
    #4  0x000000000a4cbdb9 in QThreadPrivate::start(void*) ()
    #5  0x000000000a746a6c in start ()
    #6  0x0000000000000000 in ?? ()
#}

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -O0"
{% endblock %}
