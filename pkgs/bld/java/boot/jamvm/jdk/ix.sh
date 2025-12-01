{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/java/boot/ant/9
bld/java/boot/oracle/1/jar
bld/java/boot/classpath/devel
bld/java/boot/jamvm/jdk/unwrap
{% endblock %}
