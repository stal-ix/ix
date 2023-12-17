{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="${OPTFLAGS} -fno-omit-frame-pointer -fwrapv -fno-strict-aliasing"
{% endblock %}
