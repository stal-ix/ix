{% extends '//lib/xz/t/mix.sh' %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-lzma=${out} --with-liblzma-prefix=${out} \${COFLAGS}"
{% endblock %}
