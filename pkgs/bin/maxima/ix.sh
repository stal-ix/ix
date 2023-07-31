{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sbcl
bin/rlwrap
bin/maxima/unwrap
{% endblock %}
