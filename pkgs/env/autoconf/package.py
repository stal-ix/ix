{% extends '//mix/template/env.py' %}

{% block env %}
export COFLAGS="--disable-dependency-tracking --enable-static --disable-shared $COFLAGS"
{% endblock %}
