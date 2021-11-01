{% extends '//mix/template/py.py' %}

{% block lib_deps %}
dev/lang/clang/mix.sh
{% endblock %}

{% block build %}
{% include '//mix/template/build_stdenv.py' %}
{% endblock %}
