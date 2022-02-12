{% extends '//mix/py.py' %}

{% block env %}
export LD=clang
export LDFLAGS="-fuse-ld=lld.darwinnew ${LDFLAGS}"
{% endblock %}
