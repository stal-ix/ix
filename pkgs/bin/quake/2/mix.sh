{% extends '//mix/make.sh' %}

{% block fetch %}
https://deponie.yamagi.org/quake2/quake2-8.01.tar.xz
sha:132889a6976dd7c75bf94a4ca49c76ff09cf843d66541872320d7a02a25a622c
{% endblock %}

{% block bld_libs %}
lib/c
lib/curl
lib/sdl/2
lib/opengl
lib/execinfo
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block make_flags %}
WITH_OPENAL=no
{% endblock %}

{% block bld_tool %}
bld/python
bld/scripts/dlfcn
bld/scripts/librarian
{% endblock %}

{% block setup_tools %}
{{hooks.wrap_c_compilers()}}
{% endblock %}

{% block build %}
{{super()}}

cp release/baseq2/game.so game.a
patchns game.a game

cp release/ref_gl1.so gl1.a
patchns gl1.a gl1

cp release/ref_gl3.so gl3.a
patchns gl3.a gl3

cp release/ref_soft.so soft.a
patchns soft.a soft

dl_stubs_3 << EOF >> stubs.cpp
game     GetGameAPI gameGetGameAPI
ref_gl1  GetRefAPI  gl1GetRefAPI
ref_gl3  GetRefAPI  gl3GetRefAPI
ref_soft GetRefAPI  softGetRefAPI
EOF

cc -o quake2 stubs.cpp $(find build/client -type f -name '*.o') *.a
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
