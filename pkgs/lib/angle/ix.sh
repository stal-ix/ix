{% extends '//die/c/gn.sh' %}

{% block task_pool %}full{% endblock %}

{% block git_repo %}
https://github.com/google/angle
{% endblock %}

{% block git_commit %}
dcbcee8ab32af9ddc7ae1e91c42d995e5281602c
{% endblock %}

{% block git_sha %}
b1f884f1fcf87bfe168a4f1d734eb68c1884d28f6b413f783325dda6a57bfb1e
{% endblock %}

{% block git_hook_1 %}
git rm third_party/gles1_conform
git rm third_party/dawn
{% endblock %}

{% block bld_tool %}
bld/devendor
bld/fake/binutils
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/glib
lib/kernel
lib/wayland
lib/pci/utils
{% endblock %}

{% block build_flags %}
wrap_cc
no_werror
{% endblock %}

{% block gn_args %}
angle_enable_swiftshader=false
angle_enable_vulkan=true
angle_enable_wgpu=false
angle_use_wayland=true
angle_use_x11=false
angle_enable_d3d9=false
angle_enable_d3d11=false
angle_enable_gl=false
angle_enable_metal=false
angle_enable_null=false
angle_enable_vulkan=true
angle_enable_essl=false
angle_enable_glsl=false
angle_shared_libvulkan=false
angle_build_tests=false
angle_enable_commit_id=false
clang_base_path=""
clang_use_chrome_plugins=false
clang_version={{default_clang}}
is_clang=true
custom_toolchain="//build/toolchain/linux/unbundle:default"
host_toolchain="//build/toolchain/linux/unbundle:default"
libcxx_is_shared=false
symbol_level=0
sysroot="/"
treat_warnings_as_errors=false
is_component_build=false
use_sysroot=false
use_static_angle=true
use_x11=false
ozone_platform_x11=false
vulkan_use_x11=false
ozone_platform="wayland"
angle_use_custom_libvulkan=false
angle_shared_libvulkan=false
{% endblock %}

{% block ninja_build_targets %}
libEGL.so
{% endblock %}

{% block patch %}
cat << EOF > build/config/gclient_args.gni
build_with_chromium = false
checkout_android = false
checkout_android_prebuilts_build_tools = false
checkout_android_native_support = false
checkout_ios_webkit = false
checkout_nacl = true
checkout_openxr = false
checkout_rts_model = false
checkout_src_internal = false
cros_boards = ""
cros_boards_with_qemu_images = ""
generate_location_tags = false
EOF
mkdir -p build/linux/debian_bullseye_amd64-sysroot
sed -e 's|directory + libraryName|libraryName|' \
    -i src/common/system_utils_posix.cpp
{% endblock %}

{% block configure %}
{{super()}}
find ${tmp}/obj -type f -name '*.ninja' | while read l; do
    sed -e 's|../../../../lib/clang/{{default_clang}}/lib/x86_64-unknown-linux-gnu/libclang_rt.builtins.a||' \
        -e 's|-Wno-nontrivial-memcall||g' \
        -i ${l}
done
devendor third_party/libc++
devendor third_party/libc++abi
devendor third_party/wayland/src
devendor third_party/vulkan-loader
devendor third_party/vulkan-deps/vulkan-loader
rm -rf third_party/SwiftShader
rm -rf third_party/llvm
{% endblock %}

{% block install %}
mkdir ${out}/lib
llvm-ar qL ${out}/lib/libangle.a ${tmp}/lib/libGLESv2.a ${tmp}/lib/libEGL.a
{% endblock %}

{% block env %}
export ANGLE_DIR=${out}/lib
{% endblock %}
