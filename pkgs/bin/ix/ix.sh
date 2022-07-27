{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/liner
bin/curl/ix
bin/assemble
bin/ix/unwrap
bin/bsdtar/ix
{% endblock %}
