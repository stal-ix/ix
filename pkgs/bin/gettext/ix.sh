{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/tar
bin/gzip
bin/gettext/unwrap(intl_ver=gnu)
{% endblock %}
