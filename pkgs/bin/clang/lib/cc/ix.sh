{% extends '//die/hub.sh' %}

{% block lib_deps %}
bin/clang/lib/cc/common
bin/clang/lib/cc/diag
{% if not freebsd %}
bin/clang/lib/cc/freestanding
{% endif %}
bin/clang/lib/cc/setup
{% endblock %}
