{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gzip
bin/less
bin/groff
bin/man/db/unwrap
{% endblock %}
