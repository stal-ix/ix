{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bc/{{bin_bc_ver or 'gavin'}}
{% endblock %}
