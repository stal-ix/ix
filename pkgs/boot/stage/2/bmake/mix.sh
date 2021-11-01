{% extends '//mix/template/base.sh' %}

{% block fetch %}
# url https://www.crufty.net/ftp/pub/sjg/bmake-20210808.tar.gz
# md5 e4432f5e3add4459aef28ec2017aaf05
{% endblock %}

{% block deps %}
# bld boot/stage/2/shutil/mix.sh
# bld boot/stage/1/env/mix.sh
{% endblock %}

{% block unpack %}
cd ${out} && $untar ${src}/bmake* && cd bmake
{% endblock %}

{% block configure %}
{% if mix.platform.target.os == 'linux' %}
export CPPFLAGS="-Imissing -Dstrtoul=bmake_strtoul ${CPPFLAGS}"
{% endif %}
{% endblock %}

{% block patch %}
cat << EOF > config.h
{% include 'config.h' %}
EOF

{% if mix.platform.target.os == 'linux' %}
cat << EOF >> make.h
#undef MAKE_RCSID
#define MAKE_RCSID(x)
#define __COPYRIGHT(x)
EOF
{% endif %}
{% endblock %}

{% block install %}
mkdir ${out}/bin && cat ./make > ${out}/bin/make && chmod 493 $out/bin/make
{% endblock %}

{% block build %}
clang \
    -w ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -I. \
    -DHAVE_CONFIG_H \
    -DMAKE_NATIVE \
    -DUSE_META \
    -DBMAKE_PATH_MAX=1024 \
    -D_PATH_DEFSYSPATH=\"${PWD}/mk\" \
    arch.c buf.c compat.c cond.c dir.c enum.c for.c getopt.c \
    hash.c job.c lst.c main.c make.c make_malloc.c meta.c metachar.c \
    parse.c sigcompat.c str.c stresep.c suff.c targ.c trace.c util.c var.c \
    -o make
{% endblock %}
