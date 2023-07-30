{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sbcl
bin/maxima/unwrap
{% endblock %}
