{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-fwrapv -fno-strict-aliasing"
export LDFLAGS=
export CTRFLAGS=
export OPTFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=
{% endblock %}
