{% extends '//lib/tiff/t/ix.sh' %}

# check lib/qt/6/imageformats

{% block cmake_flags %}
{{super()}}
tiff-opengl=OFF
tiff-tools=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*INTERFACE_LINK_LIBRARIES.*||' -i ${out}/lib/cmake/tiff/TiffTargets.cmake
{% endblock %}
