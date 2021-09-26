{% extends '//util/env.py' %}

{% block env %}
export LDFLAGS="-F${OSX_SDK}/System/Library/Frameworks -framework CoreFoundation ${LDFLAGS}"
{% endblock %}
