{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/assemble
bin/ix/unwrap
bin/bsdtar/lite
{% endblock %}
