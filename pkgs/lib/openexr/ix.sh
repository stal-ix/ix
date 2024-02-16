{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
OPENEXR_INSTALL_TOOLS=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|;PkgConfig::deflate||' \
    -e 's|;libdeflate::libdeflate_static||' \
    -i ${out}/lib/cmake/OpenEXR/OpenEXRTargets.cmake
{% endblock %}
