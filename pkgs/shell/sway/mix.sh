{% extends '//mix/template/meson.sh' %}

{% block fetch %}
#https://github.com/swaywm/sway/archive/refs/tags/1.6.1.tar.gz
#0bff81d89e9f9236cf00d46119ae4442
https://github.com/swaywm/sway/archive/3f58f12617ca4d6a311d060081e40bf01a73c239.zip
b7a35c2ee8e6f14d1657d3b4c97b7977
{% endblock %}

{% block bld_libs %}
lib/wlroots/trunk/mix.sh
lib/wayland/mix.sh
lib/pcre/mix.sh
lib/json/c/mix.sh
lib/cairo/mix.sh
lib/pango/mix.sh
{% endblock %}

{% block bld_tool %}
lib/dlfcn/scripts/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-Dlist_insert=sway_list_insert -Dseat_create=sway_seat_create -Dseat_destroy=sway_seat_destroy -Dserver_init=sway_server_init ${CPPFLAGS}"

python3 $(command -v gen_dl_stubs.py) opengl {{target.os}} << EOF > dl.cpp
__driDriverGetExtensions_radeonsi
__driDriverGetExtensions_zink
EOF

for i in intel lvp; do
    python3 $(command -v gen_dl_stubs.py) "/usr/lib64/libvulkan_${i}.so" {{target.os}} << EOF >> dl.cpp
__driDriverGetExtensions_zink
EOF
done

python3 $(command -v gen_dl_stubs.py) "/usr/lib64/libvulkan_radeon.so" {{target.os}} << EOF >> dl.cpp
vkGetInstanceProcAddr
vk_icdGetInstanceProcAddr
vk_icdNegotiateLoaderICDInterfaceVersion
vk_icdGetPhysicalDeviceProcAddr
EOF

cat dl.cpp

clang ${CPPFLAGS} ${CFLAGS} ${CXXFLAGS} -c dl.cpp
llvm-ar q libxxx.a dl.o
ln -s ${lib_mesa}/lib/dri/zink_dri.so libyyy.a

export LDFLAGS="${PWD}/dl.o ${PWD}/libyyy.a ${LDFLAGS}"
{% endblock %}
