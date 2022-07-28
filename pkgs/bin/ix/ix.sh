{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/liner
bin/curl/ix
bin/assemble
bin/python/ix
bin/bsdtar/ix
{% endblock %}
