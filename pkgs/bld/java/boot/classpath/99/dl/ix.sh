{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/dl(dl_for=bld/java/boot/classpath/99,dl_lib=javaio)
lib/dl(dl_for=bld/java/boot/classpath/99,dl_lib=javalang)
lib/dl(dl_for=bld/java/boot/classpath/99,dl_lib=javalangreflect)
lib/dl(dl_for=bld/java/boot/classpath/99,dl_lib=javanet)
lib/dl(dl_for=bld/java/boot/classpath/99,dl_lib=javanio)
lib/dl(dl_for=bld/java/boot/classpath/99,dl_lib=javautil)
{% endblock %}
