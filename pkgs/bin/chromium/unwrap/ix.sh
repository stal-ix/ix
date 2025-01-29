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
lib/bsd
lib/cap
lib/ffi
lib/usb
lib/exif
lib/glib
lib/xslt
lib/opus
lib/webp
lib/jpeg
lib/curl
lib/dbus
lib/avif
lib/event
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
{% endblock %}

{% block bld_tool %}
bld/flex
bin/gperf
bld/bison
bin/brotli
bin/nodejs
bld/elfutils
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

python3 build/linux/unbundle/replace_gn_files.py --system-libraries \
$use_system
python3 third_party/libaddressinput/chromium/tools/update-strings.py

# prevent annoying errors when regenerating gni
sed -i 's,^update_readme$,#update_readme,' \
third_party/libvpx/generate_gni.sh

# allow system dependencies in "official builds"
sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
tools/generate_shim_headers/generate_shim_headers.py

# https://crbug.com/893950
sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
third_party/blink/renderer/core/xml/*.cc \
third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
third_party/libxml/chromium/*.cc \
third_party/maldoca/src/maldoca/ole/oss_utils.h

{% endblock %}

{#
google_api_key=\"$_google_api_key\"
google_default_client_id=\"$_google_default_client_id\"
google_default_client_secret=\"$_google_default_client_secret\"
#}

{% block gn_args %}
clang_base_path="/usr"

custom_toolchain="//build/toolchain/linux/unbundle:default"
host_toolchain="//build/toolchain/linux/unbundle:default"

clang_use_chrome_plugins=false
fatal_linker_warnings=false
ozone_platform_x11=false
libcxx_is_shared=false
is_debug=false
sysroot="/"

use_custom_libcxx=false
use_sysroot=false
use_dbus=false
use_udev=false
use_x11=false
use_qt=false
use_cups=false
use_gnome_keyring=false
use_aura=true
use_atk=false
use_gtk=false
has_native_accessibility=false
use_nss_certs=false
use_glib=false

v8_use_external_startup_data=false
v8_enable_i18n_support=false
v8_static_library=true
v8_monolithic=true

blink_symbol_level=0
build_with_tflite_lib=false
chrome_pgo_phase=0
clang_use_chrome_plugins=false
disable_fieldtrial_testing_config=true
enable_hangout_services_extension=false
enable_nacl=false
enable_nacl_nonsfi=false
enable_precompiled_headers=false
enable_vr=false
fatal_linker_warnings=false
icu_use_data_file=true
is_cfi=false
is_clang=true
is_official_build=true
link_pulseaudio=false
proprietary_codecs=false
rtc_use_pipewire=false
symbol_level=0
treat_warnings_as_errors=false
use_allocator="none"
use_allocator_shim=false
use_cfi_icall=false
use_thin_lto=false

enable_mojom_closure_compile=false
enable_js_type_check=false

angle_static_library=true

blink_enable_generated_code_formatting=false
chrome_pgo_phase=0
clang_use_chrome_plugins=false
custom_toolchain="//build/toolchain/linux/unbundle:default"
disable_fieldtrial_testing_config=true
enable_hangout_services_extension=false
enable_nacl=false
enable_stripping=false
enable_rust=false
enable_vr=false
fatal_linker_warnings=false
ffmpeg_branding="Chrome"
host_toolchain="//build/toolchain/linux/unbundle:default"
icu_use_data_file=false
is_cfi=false
is_component_ffmpeg=true
is_debug=false

is_official_build=true
link_pulseaudio=false
proprietary_codecs=false
rtc_link_pipewire=false
rtc_use_pipewire=false
symbol_level=0
treat_warnings_as_errors=false
use_custom_libcxx=false
use_gnome_keyring=false
use_lld=true
use_pulseaudio=false
use_sysroot=false
use_system_freetype=true
use_system_harfbuzz=true
use_system_lcms2=true
use_system_libdrm=true
use_system_libffi=true
use_system_libjpeg=true
use_system_zlib=true
use_thin_lto=false
use_vaapi=false
use_partition_alloc_as_malloc=false
enable_backup_ref_ptr_support=false
{% endblock %}

{% block ninja_build_targets %}
chrome
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|\.\./.*clang|clang|' \
    -e 's|/usr/bin/brotli|'$(which brotli)'|' \
    -e 's|clang_gcc_impl.h||g' \
    -i ${tmp}/obj/toolchain.ninja
{% endblock %}
