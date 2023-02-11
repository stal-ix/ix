{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="${OPTFLAGS} -fwrapv -fno-strict-aliasing"
{% endblock %}
