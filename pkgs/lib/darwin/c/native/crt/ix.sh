{% extends '//die/env.sh' %}

{% block env %}
export CPPFLAGS="-isystem/Library/Developer/CommandLineTools/usr/lib/clang/13.0.0/include -isystem/Library/Developer/CommandLineTools/usr/lib/clang/15.0.0/include ${CPPFLAGS}"
{% endblock %}
