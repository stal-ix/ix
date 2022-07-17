{% extends 'stock/ix.sh' %}

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
