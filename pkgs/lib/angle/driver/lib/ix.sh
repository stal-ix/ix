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
lib/angle(libopenssl_ver=fake,libcurl_ver=lite)
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${ANGLE_DIR}/libangle.a ${out}/lib/
patchns ${out}/lib/libangle.a angle_
{% endblock %}
