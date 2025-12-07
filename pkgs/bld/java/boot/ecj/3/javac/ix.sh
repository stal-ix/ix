{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/java/boot/ecj/3
bld/java/boot/jamvm/1
bld/java/boot/ecj/3/javac/scripts
{% endblock %}
