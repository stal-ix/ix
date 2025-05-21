{% extends '//die/c/gn.sh' %}

{% block fetch %}
https://commondatastorage.googleapis.com/chromium-browser-official/chromium-136.0.7103.113-lite.tar.xz
sha:2eec4669d1aa6c72f7df0e5f3b106751996eed2b0e1edd7ac0dc59a74ca010d8
{% endblock %}

{% block ninja_build_targets %}
libGLESv2.so
libEGL.so
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gbm
lib/aom
lib/c++
lib/nss
lib/drm
lib/icu
lib/cap
lib/ffi
lib/usb
lib/alsa
lib/exif
lib/glib
lib/xslt
lib/opus
lib/webp
lib/jpeg
lib/dbus
lib/avif
lib/curl
lib/event
lib/dlfcn
lib/pango
lib/cairo
lib/xml/2
lib/dav1d
lib/woff2
lib/evdev
lib/kernel
lib/gcrypt
lib/bzip/2
lib/snappy
lib/brotli
lib/ffmpeg
lib/lcms/2
lib/curl/dl
lib/wayland
lib/nss/init
lib/sqlite/3
lib/json/cpp
lib/freetype
lib/harfbuzz
lib/mini/zip
lib/dbus/glib
lib/pci/utils
lib/xiph/flac
lib/wayland/dl
lib/xiph/speex
lib/fontconfig
lib/xkb/common
lib/shim/extra
lib/bsd/overlay
lib/nss/nssckbi
lib/build/errlimit
lib/vulkan/loader/dl
lib/shim/fake(lib_name=atomic)
lib/shim/fake/pkg(pkg_name=dri,pkg_ver=100500,pkg_extra=dridriverdir: /nowhere)
{% endblock %}

{% block gn_flags %}
--root=../../
{% endblock %}

{% block step_unpack %}
{{super()}}
find third_party/wayland/src -type f -name '*.c' | while read l; do
    echo > ${l}
done
cd third_party/angle
{% endblock %}

{% block bld_tool %}
bin/wayland/scanner
bld/wrapcc/link/exe/host
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${tmp}/lib/*.a ${out}/lib/
{% endblock %}

{% block gn_args %}
angle_use_custom_libvulkan=false
angle_shared_libvulkan=false
angle_build_tests=false
angle_enable_commit_id=false
blink_enable_generated_code_formatting=false
blink_symbol_level=0
build_dawn_tests=false
build_with_tflite_lib=false
chrome_pgo_phase=0
clang_base_path=""
clang_use_chrome_plugins=false
clang_version={{clang_ver or '19'}}
custom_toolchain="//build/toolchain/linux/unbundle:default"
dawn_enable_vulkan_validation_layers=false
disable_fieldtrial_testing_config=true
enable_backup_ref_ptr_support=false
enable_browser_speech_service=false
enable_component_updater=false
enable_gwp_asan=false
enable_hangout_services_extension=false
enable_mojom_closure_compile=false
enable_nacl=false
enable_nacl_nonsfi=false
enable_nocompile_tests=false
enable_perfetto_unittests=false
enable_ppapi=false
enable_precompiled_headers=false
enable_reporting=false
enable_rust=false
enable_stripping=false
enable_vr=false
fatal_linker_warnings=false
ffmpeg_branding="Chrome"
has_native_accessibility=false
host_toolchain="//build/toolchain/linux/unbundle:default"
icu_use_data_file=true
is_cfi=false
is_clang=true
is_component_ffmpeg=true
is_debug=false
is_official_build=true
is_unsafe_developer_build=true
libcxx_is_shared=false
link_pulseaudio=false
monolithic_binaries=true
ozone_platform="wayland"
ozone_platform_x11=false
perfetto_force_dcheck="off"
proprietary_codecs=false
rtc_link_pipewire=false
rtc_use_pipewire=false
symbol_level=0
sysroot="/"
rust_sysroot="/"
treat_warnings_as_errors=false
use_allocator_shim=false
use_atk=false
use_glib=false
use_aura=true
use_cfi_icall=false
use_cups=false
use_custom_libcxx=false
use_gnome_keyring=false
use_gtk=false
use_kerberos=false
use_lld=true
use_nss_certs=true
use_partition_alloc_as_malloc=false
use_pulseaudio=false
use_qt=false
use_static_angle=true
use_sysroot=false
use_thin_lto=false
use_udev=false
use_vaapi=false
use_x11=false
v8_static_library=true
angle_enable_d3d9=false
angle_enable_d3d11=false
angle_enable_gl=false
angle_enable_metal=false
angle_enable_null=false
angle_enable_vulkan=true
angle_enable_essl=false
angle_enable_glsl=false
{% endblock %}

use_system_freetype=true
use_system_harfbuzz=true
use_system_lcms2=true
use_system_libffi=true
use_system_libjpeg=true
use_system_libpng=true
use_system_libtiff=true
use_system_zlib=true

{% block env %}
export ANGLE_DIR=${out}/lib
{% endblock %}

{% block patch %}
sed -e 's|directory + libraryName|libraryName|' \
    -i src/common/system_utils_posix.cpp
{% endblock %}
