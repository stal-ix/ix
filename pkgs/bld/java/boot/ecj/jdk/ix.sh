{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bld/java/boot/ant/9
bld/java/boot/ecj/5
bld/java/boot/ecj/jdk/unwrap
bld/java/boot/classpath/devel
{% endblock %}
