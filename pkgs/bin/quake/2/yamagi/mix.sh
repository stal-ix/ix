{% extends '//mix/make.sh' %}

{% block fetch %}
https://deponie.yamagi.org/quake2/quake2-8.01.tar.xz
sha:132889a6976dd7c75bf94a4ca49c76ff09cf843d66541872320d7a02a25a622c
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/2
lib/opengl
lib/curl/dl
lib/execinfo
lib/openal/dl
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bld/scripts/dlfcn
bld/scripts/librarian
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block build %}
{{super()}}

fixallns ${PWD}

dl_stubs << EOF >> stubs.c
game     GetGameAPI game_GetGameAPI
ref_gl1  GetRefAPI  ref_gl1_GetRefAPI
ref_gl3  GetRefAPI  ref_gl3_GetRefAPI
ref_soft GetRefAPI  ref_soft_GetRefAPI
EOF

cc -o quake2 stubs.c $(find build/client -name '*.o') $(find . -name '*.so')
{% endblock %}

{% block patch %}
sed -e 's|path = FS_.*|path = "";|' \
    -e 's|fp == NULL|false|' \
    -e 's|fclose(fp);||' \
    -i src/backends/unix/system.c

sed -e 's|if (!VID_Has.*|if (false)|' -i src/client/vid/vid.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp quake2 ${out}/bin/
{% endblock %}
