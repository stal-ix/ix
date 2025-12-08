{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/java/boot/iced(opt=O0)
{% endblock %}
