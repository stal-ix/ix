{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/java/8/unwrap(opt=O0)
{% endblock %}
