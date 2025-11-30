{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/java/boot/ecj/4
bld/java/boot/jamvm/good
bld/java/boot/ecj/3/javac/scripts
{% endblock %}
