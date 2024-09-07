{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if False %}
bin/curl
bld/python
bin/ix/fetcher/scripts
{% endif %}
bld/fetch/scripts
{% endblock %}
