{% extends '//bin/telegram/desktop/unwrap/t/ix.sh' %}

{% block setup %}
{{super()}}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}
