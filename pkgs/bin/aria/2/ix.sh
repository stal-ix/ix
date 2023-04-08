{% extends '//die/hub.sh' %}

{% block run_deps %}
# missing std::binary_function
bin/aria/2/unwrap(libcplpl_ver=15)
{% endblock %}
