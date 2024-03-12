{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wget
bin/curl
#bin/aria/2
#bin/ix/curl
bin/ix/bsdtar
bin/ix/python
bin/ix/respawn
bin/ix/assemble
{% endblock %}
