{% extends '//bin/links/ix.sh' %}

{% block bld_libs %}
lib/png
lib/jpeg
lib/tiff
lib/webp
lib/avif
lib/sdl/1
lib/sdl/deps
lib/freetype
lib/sdl/1/gfx
lib/fontconfig
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-graphics
{% endblock %}

{% block cpp_defines %}
{{super()}}
GRDRV_SDL=1
{% endblock %}

{% block patch %}
{{super()}}

base64 -d << EOF > grx.c
{% include 'sdl.c/base64' %}
EOF

base64 -d << EOF > sdl_data.inc
{% include 'sdl_data.inc/base64' %}
EOF

sed -e 's|drivers=""|drivers="sdl"|' -i configure
{% endblock %}
