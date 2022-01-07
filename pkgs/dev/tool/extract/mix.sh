{% extends '//mix/template/py.py' %}

{% block run_deps %}
tool/pv
lib/archive
{% endblock %}

{% block env %}
extract() (
    pv ${2} | bsdcat | bsdtar -x -f - --strip-components ${1}
)
{% endblock %}
