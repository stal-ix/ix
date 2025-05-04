{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/tmpfs/fake
bin/ix/confine/fake
set/stalix
{% endblock %}
