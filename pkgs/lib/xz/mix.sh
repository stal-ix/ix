{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://tukaani.org/xz/xz-5.2.5.tar.xz
# md5 aa1621ec7013a19abab52a8aff04fe5b
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
dev/build/make/mix.sh
env/tools/mix.sh
env/c/mix.sh
env/bootstrap/mix.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-lzma=${out} --with-liblzma-prefix=${out} \${COFLAGS}"
{% endblock %}
