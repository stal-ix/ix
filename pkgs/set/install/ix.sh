{% extends '//die/hub.sh' %}

{% block run_deps %}
set/fs
bin/mc
bin/git
bin/wget
set/boot
bin/openssl
# for key generation
bin/openssh/client
{% endblock %}
