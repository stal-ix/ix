{% extends '//die/hub.sh' %}

{% block config_yaml %}
{% include 'config.yaml/base64' %}
{% endblock %}

{% block run_deps %}
set/pg/hosts
bin/nebula/runit(nebula_config={{self.config_yaml().strip()}})
{% endblock %}
