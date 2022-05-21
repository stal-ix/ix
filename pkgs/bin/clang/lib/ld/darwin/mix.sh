{% extends '//die/py.py' %}

{% block env %}
export LD=clang
export LDFLAGS="-fuse-ld=lld ${LDFLAGS}"
{% endblock %}
