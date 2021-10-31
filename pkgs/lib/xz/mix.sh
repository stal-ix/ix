{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://tukaani.org/xz/xz-5.2.5.tar.xz
# md5 aa1621ec7013a19abab52a8aff04fe5b
{% endblock %}

{% block deps %}
# bld lib/intl/mix.sh
# bld lib/iconv/mix.sh
# bld dev/build/make/mix.sh
# bld env/tools/mix.sh
# bld env/c/mix.sh
# bld env/bootstrap/package.py
{% endblock %}

{% block env %}
export COFLAGS="--with-lzma=${out} --with-liblzma-prefix=${out} \${COFLAGS}"
{% endblock %}
