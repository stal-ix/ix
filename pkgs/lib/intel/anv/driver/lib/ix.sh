{% extends '//die/c/ix.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block bld_tool %}
bld/librarian
{% endblock %}

{% block bld_libs %}
lib/intel/anv
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${VULKAN_LIB} ${out}/lib/
patchns ${out}/lib/*.a anv_
{% endblock %}
