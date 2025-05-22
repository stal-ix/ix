{% extends 'stock/ix.sh' %}

{% block build %}
{{super()}}

find ${PWD} -type f -name '*.so' | while read l; do
    echo ${l}
    patchns ${l} $(basename ${l} | sed -e 's|\..*||')_
done

dl_stubs << EOF >> stubs.c
game     GetGameAPI game_GetGameAPI
ref_soft GetRefAPI  ref_soft_GetRefAPI
ref_gles3 GetRefAPI  ref_gles3_GetRefAPI
EOF

cc -o quake2 stubs.c $(find build/client -name '*.o') $(find . -name '*.so')
{% endblock %}

{% block patch %}
sed -e 's|path = FS_.*|path = "";|' \
    -e 's|fp == NULL|false|' \
    -e 's|fclose(fp);||' \
    -i src/backends/unix/system.c

sed -e 's|if (!VID_Has.*|if (false)|' -i src/client/vid/vid.c

base64 -d << EOF > src/client/refresh/gl3/gl3_sdl.c
{% include 'gl3_sdl.c/base64' %}
EOF
{% endblock %}
