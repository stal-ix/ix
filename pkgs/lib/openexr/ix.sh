{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
OPENEXR_INSTALL_TOOLS=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|;PkgConfig::deflate||' -i ${out}/lib/cmake/OpenEXR/OpenEXRTargets.cmake
{% endblock %}
