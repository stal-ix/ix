{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.2.5.tar.xz
aa1621ec7013a19abab52a8aff04fe5b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/intl
lib/iconv
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}

{% block env %}
export COFLAGS="--with-lzma=${out} --with-liblzma-prefix=${out} \${COFLAGS}"
{% endblock %}
