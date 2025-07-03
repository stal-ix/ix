{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/aria/2/unwrap(libopenssl_ver=no,libssh2_ver=gcrypt,libunbound_ver=nettle)
{% endblock %}
