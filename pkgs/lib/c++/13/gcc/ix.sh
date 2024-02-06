{% extends '//lib/c++/13/ix.sh' %}

{% block setup_target_flags %}
{{super()}}
export CXXFLAGS="-std=c++14 ${CXXFLAGS}"
{% endblock %}
