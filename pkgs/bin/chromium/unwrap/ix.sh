{% extends '//die/c/gn.sh' %}

# noauto

{% block pkg_name %}
chromium
{% endblock %}

{% block version %}
115.0.5790.90
{% endblock %}

{% block fetch %}
https://commondatastorage.googleapis.com/chromium-browser-official/chromium-{{self.version().strip()}}.tar.xz
sha:82e802bcd2ae8d575d7fda9ec82db83d04d5453e9304cb482644f629232bd394
https://gitlab.alpinelinux.org/alpine/aports/-/archive/ed25dc0164fd410ab1866b69c949cb4747e69434/aports-ed25dc0164fd410ab1866b69c949cb4747e69434.tar.bz2
sha:15bbbfd8d129cfa74aa13d51e5810943faca18f05096bb5aecb88f62c4cfc66e
{% endblock %}

{% block task_pool %}full{% endblock %}

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
lib/drivers/3d
lib/bsd/overlay
lib/nss/nssckbi
lib/build/errlimit
lib/vulkan/loader/dl
lib/shim/fake/pkg(pkg_name=dri,pkg_ver=100500,pkg_extra=dridriverdir: /nowhere)
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/flex
bld/bison
bin/brotli
bin/nodejs
bld/prepend
bld/wayland
bld/de/bloat
bld/devendor
bld/elfutils
bin/gperf/prev
{% endblock %}

{% block cxx_flags %}
-Wno-invalid-offsetof
{% endblock %}

{% block cpp_flags %}
-isystem${NSS_HEADERS}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block unpack %}
{{super()}}
tar xf ${src}/aports*
mv aports* aports
{% endblock %}

{% block patches %}
chromium-revert-drop-of-system-java.patch
chromium-use-alpine-target.patch
disable-failing-tests.patch
fc-cache-version.patch
fix-missing-cstdint-include-musl.patch
fstatat-32bit.patch
gdbinit.patch
import-version.patch
mman.patch
musl-sandbox.patch
musl-tid-caching.patch
musl-v8-monotonic-pthread-cont_timedwait.patch
no-execinfo.patch
no-mallinfo.patch
no-mte.patch
no-res-ninit-nclose.patch
no-sandbox-settls.patch
pvalloc.patch
random-fixes.patch
revert-llvm16-linker-flag.patch
quiche-array.patch
temp-failure-retry.patch
{% endblock %}

{% block patch %}
ulimit -n 4096
debloat .
{% for i in ix.parse_list(self.patches()) %}
patch -p1 < aports/community/chromium/{{i}}
{% endfor %}
mkdir -p third_party/node/linux/node-linux-x64/bin
ln -s $(which node) third_party/node/linux/node-linux-x64/bin/

local use_system="
brotli
dav1d
ffmpeg
flac
fontconfig
freetype
harfbuzz-ng
icu
jsoncpp
libdrm
libevent
libjpeg
libwebp
libxml
libxslt
opus
snappy
woff2
zlib
"

for _lib in $use_system libjpeg_turbo; do
find . -type f -path "*third_party/$_lib/*" \
\! -path "*third_party/$_lib/chromium/*" \
\! -path "*third_party/$_lib/google/*" \
\! -path './base/third_party/icu/*' \
\! -path './third_party/libxml/*' \
\! -path './third_party/pdfium/third_party/freetype/include/pstables.h' \
\! -path './third_party/harfbuzz-ng/utils/hb_scoped.h' \
\! -path './third_party/crashpad/crashpad/third_party/zlib/zlib_crashpad.h' \
\! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
-delete
done

python3 build/linux/unbundle/replace_gn_files.py --system-libraries $use_system
python3 third_party/libaddressinput/chromium/tools/update-strings.py

# prevent annoying errors when regenerating gni
sed -i 's,^update_readme$,#update_readme,' third_party/libvpx/generate_gni.sh

# allow system dependencies in "official builds"
sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' tools/generate_shim_headers/generate_shim_headers.py

# https://crbug.com/893950
sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc \
    third_party/maldoca/src/maldoca/ole/oss_utils.h

sed -e 's|int close|int close_xxx|' \
    -i base/files/scoped_file_linux.cc

sed -e 's|"localtime"|"localtime_xxx"|' \
    -e 's|"localtime64"|"localtime64_xxx"|' \
    -e 's|"localtime_r"|"localtime_r_xxx"|' \
    -e 's|"localtime64_r"|"localtime64_r_xxx"|' \
    -e 's|int getaddrinfo|int getaddrinfo_xxx|' \
    -i sandbox/linux/services/libc_interceptor.cc

find content/common -type f | while read l; do
    sed -e 's|setproctitle|SetProcTitle|' -i ${l}
done

base64 -d << EOF > chrome/BUILD.gn
{% include 'BUILD.gn/base64' %}
EOF

devendor_c third_party/vulkan-deps/vulkan-loader

prepend third_party/minigbm/src/drv.c << EOF
#include <libgen.h>
EOF
{% endblock %}

{#
google_api_key=\"$_google_api_key\"
google_default_client_id=\"$_google_default_client_id\"
google_default_client_secret=\"$_google_default_client_secret\"
#}

{% block cpp_defines %}
__is_cpp17_contiguous_iterator=__libcpp_is_contiguous_iterator
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
clang_version={{clang_ver}}
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
enable_pdf=false
enable_screen_ai_service=false
enable_perfetto_unittests=false
enable_plugins=false
enable_ppapi=false
enable_precompiled_headers=false
enable_printing=false
enable_reporting=false
enable_rust=false
enable_speech_service=false
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
use_system_freetype=true
use_system_harfbuzz=true
use_system_lcms2=true
use_system_libdrm=true
use_system_libffi=true
use_system_libjpeg=true
use_system_libpng=true
use_system_libtiff=true
use_system_zlib=true
use_thin_lto=false
use_udev=false
use_vaapi=false
use_x11=false
v8_static_library=true
{% endblock %}

{% block ninja_build_targets %}
chrome
chrome_sandbox
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|/usr/bin/brotli|'$(which brotli)'|' \
    -i ${tmp}/obj/toolchain.ninja
{% endblock %}

{% block c_rename_symbol %}
SHA224_Update
SHA256_Update
SHA384_Update
SHA512_Update
CMAC_Init
CMAC_Update
HMAC_Init
HMAC_Update
MD5_Update
SHA1_Update
wl_display_cancel_read
wl_display_connect
wl_display_connect_to_fd
wl_display_create_queue
wl_display_disconnect
wl_display_dispatch
wl_display_dispatch_pending
wl_display_dispatch_queue
wl_display_dispatch_queue_pending
wl_display_flush
wl_display_get_error
wl_display_get_fd
wl_display_get_protocol_error
wl_display_prepare_read
wl_display_prepare_read_queue
wl_display_read_events
wl_display_roundtrip
wl_display_roundtrip_queue
wl_event_queue_destroy
wl_log_set_handler_client
wl_os_accept_cloexec
wl_os_dupfd_cloexec
wl_os_epoll_create_cloexec
wl_os_mremap_maymove
wl_os_recvmsg_cloexec
wl_os_socket_cloexec
wl_os_socket_peercred
wl_proxy_add_dispatcher
wl_proxy_add_listener
wl_proxy_create
wl_proxy_create_wrapper
wl_proxy_destroy
wl_proxy_get_class
wl_proxy_get_id
wl_proxy_get_listener
wl_proxy_get_tag
wl_proxy_get_user_data
wl_proxy_get_version
wl_proxy_marshal
wl_proxy_marshal_array
wl_proxy_marshal_array_constructor
wl_proxy_marshal_array_constructor_versioned
wl_proxy_marshal_array_flags
wl_proxy_marshal_constructor
wl_proxy_marshal_constructor_versioned
wl_proxy_marshal_flags
wl_proxy_set_queue
wl_proxy_set_tag
wl_proxy_set_user_data
wl_proxy_wrapper_destroy
os_resize_anonymous_file
_caches
_xdg_binary_or_text_fallback
{% endblock %}

{% block install %}
base64 -d << EOF > install.sh
{% include 'install.sh/base64' %}
EOF
sh install.sh ${tmp}/obj ${out}
{% endblock %}
