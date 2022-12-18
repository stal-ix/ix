{% extends '//die/hub.sh' %}

{% block lib_deps %}
bin/clang/lib/ld/{{target.os}}
{% endblock %}

{% block run_deps %}
bin/clang/lib/ld/{{target.os}}
{% endblock %}
