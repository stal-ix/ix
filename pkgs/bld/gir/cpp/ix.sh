{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/gir
bld/gir/cpp/bin(opt=O0)
bld/gir/cpp/scripts
{% endblock %}
