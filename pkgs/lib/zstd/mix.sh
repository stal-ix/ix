{% extends '//lib/zstd/t/mix.sh' %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-zstd=${out} \${COFLAGS}"
{% endblock %}
