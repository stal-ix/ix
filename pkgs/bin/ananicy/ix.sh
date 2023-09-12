{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ananicy/cpp(libfmt_ver=9)
{% endblock %}

{% block run_data %}
bin/ananicy/good
{% endblock %}
