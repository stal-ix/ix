{% extends '//die/py.py' %}

{% block env %}
export OPTFLAGS="-flto=thin -Wl,--thinlto-jobs=8 ${OPTFLAGS}"
{% endblock %}
