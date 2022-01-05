{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://github.com/v8/v8/archive/refs/tags/9.7.37.tar.gz
3f48a781bbad3f531720d2b7898f68aa
{% include 'urls.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
dev/build/gn
dev/tool/python
dev/build/ninja
dev/build/pkg-config
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract ${src}/9.7.37.tar.gz; cd v8*
{% include 'unpack.sh' %}
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block configure %}
>build/config/gclient_args.gni

gn gen out --args='custom_toolchain="//build/toolchain/linux/unbundle:default" host_toolchain="//build/toolchain/linux/unbundle:default" clang_use_chrome_plugins=false fatal_linker_warnings=false is_debug=false libcxx_is_shared=false ozone_platform_x11=false sysroot="/" use_custom_libcxx=false use_dbus=false use_sysroot=false use_udev=false use_x11=false v8_use_external_startup_data=false v8_static_library=true v8_enable_i18n_support=false v8_monolithic=true'

cd out

find . | grep '\.ninja' | while read l; do
    sed -e 's|-latomic||g' -i ${l}
done
{% endblock %}

{% block build %}
ninja -j 15 -C out v8
{% endblock %}
