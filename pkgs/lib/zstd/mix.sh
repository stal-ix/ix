{% extends '//lib/zstd/t/mix.sh' %}

{% block env_lib %}
export COFLAGS="--with-zstd=${out} \${COFLAGS}"
{% endblock %}
