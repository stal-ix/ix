{% extends '//die/hub.sh' %}

{% block run_deps %}
# missing std::binary_function
bin/aria/2/unwrap(cplpl_std=15)
{% endblock %}
