{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.gz
# md5 3bcd2441024d00009a5fee43f058987c
{% endblock %}

{% block deps %}
# bld lib/z/mix.sh
# bld lib/bzip2/mix.sh
# bld env/std/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block coflags %}
--enable-pcregrep-libz
--enable-pcregrep-libbz2
--enable-unicode-properties
--enable-pcre16
--enable-pcre32
--enable-jit
--disable-cpp
{% endblock %}

{% block env %}
export COFLAGS="--with-pcre=${out} \${COFLAGS}"
export CMFLAGS="-DPCRE_LIBRARY=${out}/lib/libpcre.a -DPCRE_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}
