{% extends '//mix/template/py.py' %}

{% block lib_deps %}
boot/8/clang/mix.sh
{% endblock %}

{% block run_deps %}
boot/6/env/box/mix.sh
{% endblock %}

{% block build %}
{% include '//mix/template/build_stdenv.py' %}
{% endblock %}
