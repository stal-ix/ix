{% extends '//mix/template/py.py' %}

{% block env %}
export LDFLAGS="-F${OSX_SDK}/System/Library/Frameworks -framework SystemConfiguration ${LDFLAGS}"
{% endblock %}
