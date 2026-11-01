{% extends '//die/c/configure.sh' %}

{# Wine for Wayland only: no X11, the PE side for x86_64 and i386 (new
   WoW64, so 32-bit programs need no 32-bit unix libraries).

   bin/wine is one standalone executable. ix links everything statically,
   so the unix parts (ntdll.so and the <dll>.so unixlibs) come out of
   wrap_cc as archives; bin/wine/modules collects them and the server,
   bin/wine links them into the loader, registered for Wine's dlopen through
   bin/wine/modules/dl, together with the PE dlls and data embedded by
   bin/wine/payload. The PE side is built with the raw clang
   (FREESTANDING_CLANG): the cc wrapper appends its own --target and would
   undo Wine's -target x86_64-windows. #}

{% block pkg_name %}
wine
{% endblock %}

{% block version %}
11.20
{% endblock %}

{% block fetch %}
https://dl.winehq.org/wine/source/11.x/wine-{{self.version().strip()}}.tar.xz
eac8ca448f9c0087f963026b4dc276d1e2b7fbb64056edc093e59bbb7e56fe28
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/wayland
lib/xkb/common
lib/freetype
lib/fontconfig
lib/gnutls
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/wayland
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure_flags %}
--without-x
--with-wayland
--enable-archs=i386,x86_64
--disable-tests
--disable-win16
--without-opengl
--without-vulkan
--without-alsa
--without-capi
--without-coreaudio
--without-cups
--without-dbus
--without-ffmpeg
--without-gettext
--without-gettextpo
--without-gphoto
--without-gssapi
--without-gstreamer
--without-hwloc
--without-krb5
--without-netapi
--without-opencl
--without-oss
--without-pcap
--without-pcsclite
--without-pulse
--without-sane
--without-sdl
--without-udev
--without-usb
--without-v4l2
--without-va
{% endblock %}

{% block patch %}
# Standalone mode: dlls, data and wineserver inside the wine executable,
# see include/wine/embed.h and bin/wine/payload. Without the payload the
# hooks are inert, so the first pass builds a regular tree.
base64 -d << EOF | patch -p1
{% include 'embed.patch/base64' %}
EOF
# The loader is one static, non-PIC program here: no -pie, no
# --export-dynamic (nothing loads against it), and no wine-preloader, whose
# fixed high -Ttext the non-PIC objects cannot reach; ntdll execs the loader
# directly when the preloader is absent.
sed -e 's|^\( *\)wine_use_preloader=yes$|\1wine_use_preloader=no|' \
    -e 's|as_fn_append WINELOADER_LDFLAGS " -pie"|:|' \
    -e 's|WINELOADER_LDFLAGS="-Wl,--export-dynamic"|WINELOADER_LDFLAGS=|' \
    -i configure
{% endblock %}

{# no serial retry after a parallel failure: on Wine it only takes hours to
   fail the same way #}
{% block build %}
make -j ${make_thrs}
{% endblock %}

{% block configure %}
export x86_64_CC=${FREESTANDING_CLANG}
export i386_CC=${FREESTANDING_CLANG}
# clang's own headers (emmintrin.h and co) live apart in ix, see CLANG_HEADERS
export CROSSCFLAGS="-O2 -isystem ${CLANG_HEADERS}"
# the C99 probe includes stdio.h and friends, which a bare clang has no
# sysroot for; Wine's PE side uses its own include/msvcrt instead
export ac_cv_i386_crosscc_c99=
export ac_cv_x86_64_crosscc_c99=
# configure finds a soname by reading a dynamically linked test program;
# with static libraries that finds nothing, so name them: Wine dlopens
# these and ix's dlfcn serves them from the matching lib/<name>/dl
export ac_cv_lib_soname_freetype=libfreetype.so.6
export ac_cv_lib_soname_fontconfig=libfontconfig.so.1
export ac_cv_lib_soname_gnutls=libgnutls.so.30
export ac_cv_lib_soname_xkbregistry=libxkbregistry.so.0
{{super()}}
{% endblock %}
