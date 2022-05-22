{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/0/ix/{{host.os}}/{{host.arch}}
{% endblock %}
