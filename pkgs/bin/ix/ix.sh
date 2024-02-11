{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/aria/2
bin/ix/curl
bin/su/exec
bin/ix/bsdtar
bin/ix/python
bin/ix/respawn
bin/ix/assemble
{% endblock %}
