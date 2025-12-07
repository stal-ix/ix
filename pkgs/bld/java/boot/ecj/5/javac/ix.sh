{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/java/boot/ecj/5
bld/java/boot/jamvm/good
bld/java/boot/ecj/5/javac/scripts
{% endblock %}
