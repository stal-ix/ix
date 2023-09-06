{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if clang_ver %}
bin/clang/{{clang_ver}}(clang_ver=)
{% else %}
bin/clang/17
{% endif %}
{% endblock %}
