{% extends '//mix/template/py.py' %}

{% block lib_deps %}
boot/stage/8/clang/mix.sh
{% endblock %}

{% block run_deps %}
boot/stage/7/env/tools/mix.sh
{% endblock %}

{% block build %}
{% include '//mix/template/build_stdenv.py' %}
{% endblock %}
