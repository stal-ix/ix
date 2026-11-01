{% extends '//die/c/make.sh' %}

{% block pkg_name %}
yquake2
{% endblock %}

{% block version %}
8.70
{% endblock %}

{% block fetch %}
https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_{{self.version().strip().replace('.', '_')}}.tar.gz
ace0a4eb4326e6406519c1ffe378f08f59080c8d5272e814ee898fa28e5739c2
{% endblock %}

{% block modules %}
game
ref_soft
ref_gles3
{% endblock %}

{% block bld_tool %}
bin/pkg/conf
bld/wrap/cc/plugins/rdynamic/fake
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
WITH_SDL3=yes
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
