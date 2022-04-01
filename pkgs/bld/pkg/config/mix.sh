{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/pkg-config(intl_ver=stub)
{% endblock %}
