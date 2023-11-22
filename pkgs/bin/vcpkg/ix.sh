{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/vcpkg/ix(libfmt_ver=10)
{% endblock %}
