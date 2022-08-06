{% extends '//die/c/gn.sh' %}

{% block fetch %}
#https://commondatastorage.googleapis.com/chromium-browser-official/chromium-97.0.4692.71.tar.xz
#1e1df783cb111d3c07903ac64e3ae038
{% endblock %}

{% block unpack %}
cd /home/pg/data/src/chromium-104.0.5112.81
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/nss
lib/drm
lib/xml2
lib/glib
lib/xslt
lib/pango
lib/cairo
lib/opengl
lib/mesa/gl
lib/wayland
lib/mesa/egl
lib/pciutils
lib/xkbcommon
lib/shim/extra
lib/shim/queue
lib/shim/atomic
{% endblock %}

{% block bld_tool %}
bin/gperf
bin/nodejs
{% endblock %}

{% block gn_args %}
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
enable_hangout_services_extension=true
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
{% endblock %}

{% block ninja_build_targets %}
chrome
{% endblock %}

{% block patch %}
rm -rf third_party/node/linux/node-linux-x64/bin
mkdir -p third_party/node/linux/node-linux-x64/bin
ln -s $(which node) third_party/node/linux/node-linux-x64/bin/
{% endblock %}

{% block setup %}
export CPPFLAGS=$(echo ${CPPFLAGS} | tr ' ' '\n' | grep -v mesa | tr '\n' ' ')
{% endblock %}

{% block install %}
exit 1
{% endblock %}
