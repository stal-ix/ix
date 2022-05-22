{% extends '//die/gn.sh' %}

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

{% block unpack %}
mkdir src; cd src; extract1 ${src}/9.7.37.tar.gz
{% include 'unpack.sh' %}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
>build/config/gclient_args.gni
{% endblock %}

{% block configure %}
{{super()}}

cd {{ninja_build_dir}}

find . | grep '\.ninja' | while read l; do
    sed -e 's|-latomic||g' -i ${l}
done
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

v8_use_external_startup_data=false
v8_enable_i18n_support=false
v8_static_library=true
v8_monolithic=true
{% endblock %}

{% block ninja_build_targets %}
d8 v8_monolith
{% endblock %}

{% block install %}
cp -R include ${out}

mkdir ${out}/lib ${out}/bin

cd {{ninja_build_dir}}

mv d8 ${out}/bin/
mv obj/libv8_monolith.a ${out}/lib/
{% endblock %}
