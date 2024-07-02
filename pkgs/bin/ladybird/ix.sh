{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ladybird/unwrap(libpng_ver=a)
{% endblock %}
