{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
bin/clang/lib/ld/{{target.os}}
{% endblock %}
