{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/imv/unwrap(libjpeg_ver=turbo)
{% endblock %}
