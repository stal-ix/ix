{% extends '//mix/template/py.py' %}

{% block env %}
export LDFLAGS="-F${OSX_SDK}/System/Library/Frameworks -framework Security ${LDFLAGS}"
{% endblock %}
