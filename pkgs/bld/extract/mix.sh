{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/pv
bld/tar
{% endblock %}

{% block env %}
extract() (
    pv \${2} | bsdcat | bsdtar -x -f - --strip-components \${1}
)
{% endblock %}
