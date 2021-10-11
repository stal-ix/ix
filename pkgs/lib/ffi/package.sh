{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
# md5 294b921e6cf9ab0fbaea4b639f8fdbe8
{% endblock %}

{% block deps %}
# bld {{'lib/linux' | linux}}
# bld dev/build/make tool/text/gnu/sed env/std
{% endblock %}

{% block env %}
export LIBFFI_CFLAGS="-I${out}/include"
export LIBFFI_LIBS="-L${out}/lib -lffi"
export LDFLAGS="\$LIBFFI_LIBS \${LDFLAGS}"
export COFLAGS="--with-system-ffi=${out} \${COFLAGS}"
{% endblock %}
