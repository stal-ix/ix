{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
# md5 294b921e6cf9ab0fbaea4b639f8fdbe8
{% endblock %}

{% block bld_deps %}
{{'lib/linux/mix.sh' | linux}}
gnu/sed/mix.sh
env/std/0/mix.sh
{% endblock %}

{% block env %}
export LIBFFI_CFLAGS="-I${out}/include"
export LIBFFI_LIBS="-L${out}/lib -lffi"
export COFLAGS="--with-system-ffi=${out} \${COFLAGS}"
{% endblock %}
