{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/aligrudi/neatlibc
{% endblock %}

{% block git_commit %}
a1ae8a903e13152e360fe719ecbe0ba7c2d817af
{% endblock %}

{% block git_sha %}
492a1a238ceedceebbb1acb6fa766d00de10b20ed6e62ef2acaa2a617e741db0
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

{% block setup %}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

{% block env %}
export CPPFLAGS="-fno-pic -fno-pie -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
