{% extends '//bin/telegram/desktop/unwrap/t/mix.sh' %}

{% block ninja_threads %}10{% endblock %}

{% block setup %}
{{super()}}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block patch1 %}
base64 -d << EOF | patch -p1
{% include '0.diff/base64' %}
EOF

{{super()}}
{% endblock %}
