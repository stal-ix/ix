{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/raygard/wak/archive/dca8c09e9e20581330dd930b0219b07f431f2388.tar.gz
sha:d7f814eefafa5cfa5b3eb9a1ef7a700f39cb8dd5a3d3695a0213c82f5b48d779
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/2/shutil
bld/boot/1/env
{% endblock %}

{% block unpack %}
mkdir src
cd src
extract0 ${src}/*gz
cd wak*
{% endblock %}

{% block build %}
mkdir -p ${out}/bin
${CC} ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} monosrc/mono.c -o ${out}/bin/awk
{% endblock %}
