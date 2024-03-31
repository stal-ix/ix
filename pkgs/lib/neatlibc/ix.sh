{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/aligrudi/neatlibc
{% endblock %}

{% block git_commit %}
a1ae8a903e13152e360fe719ecbe0ba7c2d817af
{% endblock %}

{% block git_sha %}
a9e202b652e12992a182245001aa7bbe063bfa3e34e879e8f835c6f27a54f928
{% endblock %}

{% block bld_tool %}
bld/nasm
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

{% block setup_target_flags %}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

{% block env %}
export CPPFLAGS="-fno-pic -fno-pie -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
