{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/curl/{{bin_curl_ver or 'full'}}
{% endblock %}
