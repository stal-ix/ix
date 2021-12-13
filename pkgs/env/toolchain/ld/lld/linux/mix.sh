{% extends '//mix/template/py.py' %}

{% block env %}
export LD=clang
export LDFLAGS="-nostdlib++ -fuse-ld=lld ${LDFLAGS}"
{% endblock %}
