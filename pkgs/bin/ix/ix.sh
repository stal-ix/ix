{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bsdtar
bin/ix/fetcher
bin/ix/assemble
bin/ix/runsvdir
bin/python/frozen
bin/ix/tmpfs/fake
bin/ix/confine/fake
{% endblock %}
