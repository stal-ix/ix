{% extends '//die/c/gn.sh' %}

{% block fetch %}
https://commondatastorage.googleapis.com/chromium-browser-official/chromium-115.0.5790.90.tar.xz
sha:82e802bcd2ae8d575d7fda9ec82db83d04d5453e9304cb482644f629232bd394
https://gitlab.alpinelinux.org/alpine/aports/-/archive/ed25dc0164fd410ab1866b69c949cb4747e69434/aports-ed25dc0164fd410ab1866b69c949cb4747e69434.tar.bz2
sha:15bbbfd8d129cfa74aa13d51e5810943faca18f05096bb5aecb88f62c4cfc66e
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/aom
lib/c++
lib/nss
lib/drm
lib/icu
lib/drm
lib/cap
lib/ffi
lib/usb
lib/exif
lib/glib
lib/xslt
lib/opus
lib/webp
lib/jpeg
lib/dbus
lib/avif
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
lib/opengl
lib/wayland
lib/sqlite/3
lib/json/cpp
lib/freetype
lib/harfbuzz
lib/dbus/glib
lib/pci/utils
lib/xiph/flac
lib/xiph/speex
lib/fontconfig
lib/xkb/common
lib/shim/extra
lib/bsd/overlay
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/flex
bin/gperf
bld/bison
bin/brotli
bin/nodejs
bld/elfutils
{% endblock %}

{% block cxx_flags %}
-Wno-missing-template-arg-list-after-template-kw
-Wno-invalid-offsetof
{% endblock %}

{% block cpp_includes %}
${NSS_HEADERS}
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

sed -e 's|deque_->size()|deque_->Size()|' \
    -i net/third_party/quiche/src/quiche/quic/core/quic_interval_deque.h

sed -e 's|int close|int close_xxx|' \
    -i base/files/scoped_file_linux.cc
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
#angle_shared_libvulkan=false
#compile_suid_client=false
#compile_syscall_broker=false
#enable_base_tracing=false
angle_build_tests=false
angle_enable_commit_id=false
angle_static_library=true
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
enable_js_type_check=false
enable_mojom_closure_compile=false
enable_nacl=false
enable_nacl_nonsfi=false
enable_nocompile_tests=false
enable_pdf=false
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
use_aura=true
use_cfi_icall=false
use_cups=false
use_custom_libcxx=false
use_dbus=false
use_glib=false
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
v8_enable_i18n_support=false
v8_monolithic=true
v8_static_library=true
v8_use_external_startup_data=false
{% endblock %}

{% block ninja_build_targets %}
chrome
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|/usr/bin/brotli|'$(which brotli)'|' \
    -i ${tmp}/obj/toolchain.ninja
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export CPPFLAGS=$(echo "${CPPFLAGS}" | tr ' ' '\n' | grep -v vulkan-headers | grep -v lib-mesa | tr '\n' ' ')
{% endblock %}
