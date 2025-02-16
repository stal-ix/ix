{% extends '//die/c/ix.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/shim/ix
lib/execinfo
{% endblock %}

{% block bld_tool %}
bld/librarian
{% endblock %}

{% block bld_libs %}
lib/swift/shader
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${SWIFTSHADER_LIB} ${out}/lib/
patchns ${out}/lib/*.a sw_
{% endblock %}
