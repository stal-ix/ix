{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20210808.tar.gz
sha:40a5860812091a0613b9542637a0f4aa05f38889e2a1f889f0e827feb41357d2
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/2/shutil
bld/boot/1/env
{% endblock %}

{% block unpack %}
cd ${out}

mkdir bin; cd bin
mkdir src; cd src

extract0 ${src}/bmake*; cd bmake*
{% endblock %}

{% block step_setup %}
{% if linux %}
export CPPFLAGS="-Imissing -Dstrtoul=bmake_strtoul ${CPPFLAGS}"
{% endif %}
{{super()}}
{% endblock %}

{% block patch %}
cat << EOF > config.h
{% include 'config.h' %}
EOF

{% if linux %}
cat << EOF >> make.h
#undef MAKE_RCSID
#define MAKE_RCSID(x)
#define __COPYRIGHT(x)
EOF
{% endif %}
{% endblock %}

{% block build %}
${CC} -w -I. \
    ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}      \
    -DHAVE_CONFIG_H                       \
    -DMAKE_NATIVE                         \
    -DUSE_META                            \
    -DBMAKE_PATH_MAX=1024                 \
    -D_PATH_DEFSYSPATH=\"${PWD}/mk\"      \
    arch.c buf.c compat.c cond.c dir.c    \
    enum.c for.c getopt.c hash.c job.c    \
    lst.c main.c make.c make_malloc.c     \
    meta.c metachar.c parse.c sigcompat.c \
    str.c stresep.c suff.c targ.c trace.c \
    util.c var.c                          \
    -o ${out}/bin/bmake
{% endblock %}
