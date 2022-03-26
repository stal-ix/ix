{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wayfire/releases/download/v0.7.2/wayfire-0.7.2.tar.xz
sha:c6785613df438e64aa5dcce798a0205c83cd2f36102669fcfd0050e7a58c5abd
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/png
lib/glm
lib/mesa
lib/xml2
lib/jpeg
lib/seat
lib/cairo
lib/pango
lib/evdev
lib/input
lib/pixman
lib/wayland
lib/mesa/egl
lib/freetype
lib/execinfo
lib/xkbcommon
lib/wl/config
lib/drivers/3d
lib/wlroots/14
lib/mesa/glesv2
{% endblock %}

{% block bld_tool %}
lib/dlfcn/scripts
bin/wayland/protocols
{% endblock %}

{% block patch %}
base64 -d << EOF > src/api/wayfire/option-wrapper.hpp
{% include 'opts1.h/base64' %}
EOF
{% endblock %}

{% block build %}
{{super()}}

cd ${tmp}

llvm-nm --no-demangle --print-file-name -j $(find . -name '*.o') | grep newInstance | while read l; do
    p=$(echo ${l} | sed -e 's|:.*||')
    f=$(basename ${p})
    n=$(echo ${f} | sed -e 's|.cpp.o||' | tr '-' '_')

    llvm-objcopy --preserve-dates \
        --redefine-sym "newInstance=newInstance_${n}"             \
        --redefine-sym "getWayfireVersion=getWayfireVersion_${n}" \
        ${p}
done

llvm-nm --no-demangle --print-file-name -j $(find . -name '*.o') | grep newInstance | while read l; do
    n=$(echo ${l} | sed -e 's|.*newInstance_||')

    cat << EOF | dl_stubs_2 $(echo ${n} | tr '_' '-') >> stub.cpp
newInstance newInstance_${n}
getWayfireVersion getWayfireVersion_${n}
EOF
done

cc -o real_wayfire stub.cpp $(find ${tmp} -type f -name '*.o')
{% endblock %}

{% block install %}
{{super()}}
cp ${tmp}/real_wayfire ${out}/bin/wayfire
{% endblock %}
