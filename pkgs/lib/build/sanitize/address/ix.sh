{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-fsanitize=address -fno-omit-frame-pointer ${OPTFLAGS}"
{% endblock %}
