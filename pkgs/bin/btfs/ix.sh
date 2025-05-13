{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/btfs/unwrap
bin/fusermount/3
{% endblock %}
