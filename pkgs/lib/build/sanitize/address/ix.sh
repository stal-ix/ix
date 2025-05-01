{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-fsanitize=address -fno-omit-frame-pointer ${CFLAGS}"
{% endblock %}
