{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
dev/lang/rustc/1/56/{{mix.platform.host.os}}/mix.sh
{% endblock %}
