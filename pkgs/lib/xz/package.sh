{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://tukaani.org/xz/xz-5.2.5.tar.xz
# md5 aa1621ec7013a19abab52a8aff04fe5b
{% endblock %}

{% block deps %}
# bld lib/intl/package.sh
# bld lib/iconv/package.sh
# bld dev/build/make/package.sh
# bld env/tools/package.sh
# bld env/c/package.sh
# bld env/bootstrap/package.py
{% endblock %}

{% block env %}
export COFLAGS="--with-lzma=${out} --with-liblzma-prefix=${out} \${COFLAGS}"
{% endblock %}
