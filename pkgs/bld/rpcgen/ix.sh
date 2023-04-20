{% extends '//die/hub.sh' %}

{% block run_deps %}
# TODO(pg): fix intl dispatch
bin/rpcgen(intl_ver=no)
{% endblock %}
