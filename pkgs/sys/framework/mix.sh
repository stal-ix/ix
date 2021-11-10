{% extends '//mix/template/py.py' %}

{% block run_deps %}
env/darwin/mix.sh
{% endblock %}

{% block env %}
{% set framework %}
{% block framework %}
{% endblock %}
{% endset %}

export LDFLAGS="-F${OSX_SDK}/System/Library/Frameworks -framework {{framework.strip()}} ${LDFLAGS}"
{% endblock %}
