{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/tar
{% endblock %}

{% block env %}
extract() (
    bsdcat \${2} | bsdtar -x -f - --strip-components \${1}
)
{% endblock %}
