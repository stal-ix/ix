{% extends '//die/proxy.sh' %}

{% block env %}
extract() (
    bsdcat \${2} | bsdtar -x -f - --no-same-permissions --no-same-owner --strip-components \${1}
)
{% endblock %}
