{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
env/toolchain/ld/lld/{{target.os}}/mix.sh
{% endblock %}
