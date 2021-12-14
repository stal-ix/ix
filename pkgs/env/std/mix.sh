{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
env/std/c/mix.sh
env/box/mix.sh
tool/pv/mix.sh
tool/compress/unzip/mix.sh
lib/archive/mix.sh
{% endblock %}
