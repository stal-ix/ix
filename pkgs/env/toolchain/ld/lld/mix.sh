{% extends '//mix/template/hub.sh' %}

{% block deps %}
env/toolchain/ld/lld/{{mix.platform.target.os}}/mix.sh
{% endblock %}
