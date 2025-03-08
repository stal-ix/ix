{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/pkg/config/wrapped/scripts
bin/pkg/config/unwrap(intl_ver=stub,libglib_ver=82)
{% endblock %}
