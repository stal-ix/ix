{% extends '//die/env.sh' %}

{% block env %}
export LD=mold
export LDFLAGS="-fuse-ld=mold ${LDFLAGS}"
{% endblock %}
