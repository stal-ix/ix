{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/aligrudi/neatlibc/archive/a1ae8a903e13152e360fe719ecbe0ba7c2d817af.zip
sha:32a44d1852fbb5c2c908dfb39daa6e3d7c5654b07b9a243a46efc0e358bb1ee1
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block make_flags %}
CC=${CC}
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp *.a ${out}/lib/
mkdir ${out}/include
cp *.h ${out}/include/
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-fno-pic -fno-pie -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
