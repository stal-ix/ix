{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
env/toolchain/ld/lld/{{mix.platform.target.os}}/mix.sh
{% endblock %}
