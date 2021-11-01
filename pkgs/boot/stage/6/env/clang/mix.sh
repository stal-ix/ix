{% extends '//mix/template/py.py' %}

{% block lib_deps %}
boot/stage/6/clang/mix.sh
{% endblock %}

{% block run_deps %}
boot/stage/6/env/tools/mix.sh
{% endblock %}

{% block build %}
{% include '//mix/template/build_stdenv.py' %}
{% endblock %}
