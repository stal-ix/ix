{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wget
bin/curl
bin/ix/fetcher/scripts
{% endblock %}
