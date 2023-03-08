{% extends '//lib/c++/13/ix.sh' %}

{% block setup %}
{{super()}}
export CXXFLAGS="-std=c++14 ${CXXFLAGS}"
{% endblock %}
