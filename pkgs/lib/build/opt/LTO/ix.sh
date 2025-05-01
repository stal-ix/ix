{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-flto=thin ${CFLAGS}"
export LDFLAGS="-Wl,--thinlto-jobs=8 ${LDFLAGS}"
{% endblock %}
