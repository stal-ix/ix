{% extends '//die/py.py' %}

{% block env %}
export LDFLAGS="-nostdlib -nostdlib++ ${LDFLAGS}"
export CPPFLAGS="-nostdinc -nostdinc++ ${CPPFLAGS}"
{% endblock %}
