{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/rmyorston/pdpmake/archive/refs/tags/1.4.0.tar.gz
sha:d17600f2699938980cc8734ed9f1cd993b11264e22b6fe2c18cdb8ed6ab5045d
{% endblock %}

{% block bld_deps %}
bld/boot/2/shutil
bld/boot/1/env
{% endblock %}

{% block unpack %}
mkdir src
cd src
extract0 ${src}/1*
cd p*
{% endblock %}

{% block build %}
mkdir ${out}/bin
${CC} -w ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} *.c -o ${out}/bin/bmake
{% endblock %}
