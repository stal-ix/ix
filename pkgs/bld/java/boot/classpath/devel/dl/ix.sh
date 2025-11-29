{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/dl(dl_for=bld/java/boot/classpath/devel,dl_lib=javaio)
lib/dl(dl_for=bld/java/boot/classpath/devel,dl_lib=javalang)
lib/dl(dl_for=bld/java/boot/classpath/devel,dl_lib=javalangreflect)
lib/dl(dl_for=bld/java/boot/classpath/devel,dl_lib=javanet)
lib/dl(dl_for=bld/java/boot/classpath/devel,dl_lib=javanio)
lib/dl(dl_for=bld/java/boot/classpath/devel,dl_lib=javautil)
{% endblock %}
