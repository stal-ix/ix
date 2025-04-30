{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-fno-omit-frame-pointer -fwrapv -fno-strict-aliasing ${CFLAGS}"
{% endblock %}
