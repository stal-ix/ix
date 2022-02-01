{% extends '//mix/template/py.py' %}

{% block env_lib %}
export OPTFLAGS="-flto=thin -Wl,--thinlto-jobs=8 ${OPTFLAGS}"
{% endblock %}
