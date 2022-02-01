{% extends '//mix/template/py.py' %}

{% block env_lib %}
export OPTFLAGS="-fsanitize=address -fno-omit-frame-pointer ${OPTFLAGS}"
{% endblock %}
