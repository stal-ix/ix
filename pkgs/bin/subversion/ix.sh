{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/openssh/client
bin/subversion/unwrap(libopenssl_ver=1)
{% endblock %}
