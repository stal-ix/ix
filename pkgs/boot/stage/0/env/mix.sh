{% extends '//mix/template/py.py' %}

{% block lib_deps %}
boot/stage/0/mix/mix.sh
{% endblock %}

{% block run_deps %}
env/system/mix.sh
env/compiler/mix.sh
env/bootstrap/mix.sh
{% endblock %}

{% block build %}
# boot/stage/0/{{mix.platform.target.os}}
{% include '//mix/template/build_stdenv.py' %}
{% endblock %}
