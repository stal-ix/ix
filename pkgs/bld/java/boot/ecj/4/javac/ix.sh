{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/java/boot/ecj/4
bld/java/boot/jamvm/2
bld/java/boot/ecj/5/javac/scripts
{% endblock %}
