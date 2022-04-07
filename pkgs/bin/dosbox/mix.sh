{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/dosbox/dosbox/0.74-3/dosbox-0.74-3.tar.gz
sha:c0d13dd7ed2ed363b68de615475781e891cd582e8162b5c3669137502222260a
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/1
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
{% endblock %}

{% block setup_toolsq %}
C=$(which clang)
CP=$(which clang++)

cat << EOF > clang
#!/bin/sh
${C} ${lib_sdl_1_chimera_dl}/lib/reg.o "\$@"
EOF

cat << EOF > clang++
#!/bin/sh
${CP} ${lib_sdl_1_chimera_dl}/lib/reg.o "\$@"
EOF

chmod +x clang clang++
{% endblock %}
