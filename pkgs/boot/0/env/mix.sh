{% extends '//mix/template/py.py' %}

{% block lib_deps %}
boot/0/mix/{{mix.platform.target.os}}/{{mix.platform.target.arch}}/mix.sh
{% endblock %}

{% block run_deps %}
env/system/mix.sh
env/compiler/mix.sh
env/bootstrap/mix.sh
{% endblock %}

{% block build %}
{% include '//mix/template/build_stdenv.py' %}
{% endblock %}
