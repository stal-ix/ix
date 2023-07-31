{% extends 't/ix.sh' %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block cmake_flags %}
{{super()}}
BUILD_PKGCONFIG_FILES=ON
OPENJPEG_INSTALL_PACKAGE_DIR="lib/cmake/openjpeg-{{self.version()}}"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
>cmake/openjpeg-{{self.version()}}/OpenJPEGTargets.cmake
for i in pkgconfig/*.pc; do
    sed -e 's|bindir.*||' -i ${i}
done
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/openjpeg-{{self.version()}} \${CPPFLAGS}"
{% endblock %}
