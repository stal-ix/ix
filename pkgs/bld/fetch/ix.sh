{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if not isfile('/bin/fetcher') %}
bin/curl
bld/python
bin/ix/fetcher/scripts
{% endif %}
bld/fetch/scripts
{% endblock %}
