{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/git
# quiet gen broken
bin/tig/unwrap(verbose=1)
{% endblock %}
