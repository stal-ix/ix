{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
env/toolchain/ld/lld/{{target.os}}/mix.sh
{% endblock %}
