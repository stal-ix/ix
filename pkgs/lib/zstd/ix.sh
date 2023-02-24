{% extends '//lib/zstd/t/ix.sh' %}

{% block env %}
export COFLAGS="--with-zstd=${out} \${COFLAGS}"
{% endblock %}
