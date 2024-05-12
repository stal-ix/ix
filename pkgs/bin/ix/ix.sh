{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wget
bin/curl
bin/ix/bsdtar
bin/ix/python
bin/ix/assemble
{% endblock %}
