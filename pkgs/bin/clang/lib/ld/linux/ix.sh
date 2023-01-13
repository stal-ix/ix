{% extends '//die/env.sh' %}

{% block env %}
export LD=clang
export LDFLAGS="-nostdlib++ -fuse-ld=lld ${LDFLAGS}"
{% endblock %}
