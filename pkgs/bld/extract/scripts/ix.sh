{% extends '//die/gen.sh' %}

{% block env %}
extract() (
    bsdcat \${2} | bsdtar -x -f - --no-same-permissions --no-same-owner --strip-components \${1}
)

extract0() (
    extract 0 \${1}
)

extract1() (
    extract 1 \${1}
)
{% endblock %}
