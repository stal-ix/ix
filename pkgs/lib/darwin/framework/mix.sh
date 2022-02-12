{% extends '//mix/py.py' %}

{% block lib_deps %}
lib/darwin/c
{% endblock %}

{% block env %}
{% set framework %}
{% block framework %}
{% endblock %}
{% endset %}

export CPPFLAGS="-F${OSX_SDK}/System/Library/Frameworks -framework {{framework.strip()}} ${CPPFLAGS}"
export LDFLAGS="-F${OSX_SDK}/System/Library/Frameworks -framework {{framework.strip()}} ${LDFLAGS}"
{% endblock %}
