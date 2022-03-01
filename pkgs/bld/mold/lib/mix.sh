{% extends '//mix/py.py' %}

{% block env %}
export LD=mold
export LDFLAGS="-fuse-ld=mold ${LDFLAGS}"
{% endblock %}
