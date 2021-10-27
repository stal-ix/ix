{% extends '//mix/template/env.py' %}

{% block env %}
export LD=clang
export LDFLAGS="-static -nostdlib -nostdlib++ -fuse-ld=lld ${LDFLAGS}"
{% endblock %}
