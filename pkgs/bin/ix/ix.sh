{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bsdtar
bin/ix/fetcher
bin/ix/assemble
bin/python/frozen
{% endblock %}
