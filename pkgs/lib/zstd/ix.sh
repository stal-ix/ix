{% extends '//lib/zstd/t/ix.sh' %}

{% block env_lib %}
export COFLAGS="--with-zstd=${out} \${COFLAGS}"
{% endblock %}
