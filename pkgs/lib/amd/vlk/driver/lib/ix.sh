{% extends '//die/c/ix.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/librarian
{% endblock %}

{% block bld_libs %}
lib/amd/vlk
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${AMDVLK_LIB} ${out}/lib/
patchns ${out}/lib/*.a amdvlk_
{% endblock %}
