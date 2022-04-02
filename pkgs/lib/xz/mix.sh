{% extends '//lib/xz/t/mix.sh' %}

{% block env_lib %}
export COFLAGS="--with-lzma=${out} --with-liblzma-prefix=${out} \${COFLAGS}"
{% endblock %}
