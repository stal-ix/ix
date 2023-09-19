{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/tar
bld/gzip
bin/gettext/unwrap(intl_ver=gnu)
{% endblock %}
