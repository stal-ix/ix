{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ethtool
bin/hwinfo/unwrap
{% endblock %}
