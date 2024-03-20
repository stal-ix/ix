{% extends '//lib/tiff/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
tiff-opengl=OFF
tiff-tools=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*INTERFACE_LINK_LIBRARIES.*||' -i ${out}/lib/cmake/tiff/TiffTargets.cmake
{% endblock %}
