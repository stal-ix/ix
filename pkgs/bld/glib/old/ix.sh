{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/glib/codegen/old(intl_ver=no)
{% endblock %}
