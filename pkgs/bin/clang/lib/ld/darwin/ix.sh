{% extends '//die/env.sh' %}

{% block env %}
export LD=clang
export LDFLAGS="-fuse-ld=lld ${LDFLAGS}"
{% endblock %}
