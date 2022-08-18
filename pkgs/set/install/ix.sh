{% extends '//die/hub.sh' %}

{% block run_deps %}
set/fs
bin/mc
bin/git
bin/wget
set/boot
# for key generation
bin/openssh
bin/openssl
{% endblock %}
