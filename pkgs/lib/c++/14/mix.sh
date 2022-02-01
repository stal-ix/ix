{% extends '//lib/c++/any/mix.sh' %}

{% block setup %}
{{super()}}
export CXXSTD="-std={% block cplpl_std %}c++14{% endblock %}"
export CXXFLAGS="${CXXSTD} ${CXXFLAGS}"
{% endblock %}

{% block env_lib %}
export CXXFLAGS="${CXXSTD} \${CXXFLAGS}"
{% endblock %}
