{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ananicy/cpp(libfmt_ver=9,libcplpl_ver=16,libnlohmann_json_ver=10)
{% endblock %}

{% block run_data %}
bin/ananicy/good
{% endblock %}
