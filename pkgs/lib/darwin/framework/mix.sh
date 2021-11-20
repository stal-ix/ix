{% extends '//mix/template/py.py' %}

{% block lib_deps %}
lib/darwin/c/mix.sh
{% endblock %}

{% block env %}
{% set framework %}
{% block framework %}
{% endblock %}
{% endset %}

export LDFLAGS="-F${OSX_SDK}/System/Library/Frameworks -framework {{framework.strip()}} ${LDFLAGS}"
{% endblock %}
