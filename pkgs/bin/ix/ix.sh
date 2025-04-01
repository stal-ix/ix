{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bsdtar
bin/ix/jail
bin/ix/fetcher
bin/ix/assemble
bin/ix/runsvdir
bin/python/frozen
{% endblock %}
