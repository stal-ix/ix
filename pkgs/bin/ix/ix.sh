{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/curl
bin/ix/bsdtar
bin/ix/python
bin/ix/respawn
bin/ix/assemble
{% endblock %}
