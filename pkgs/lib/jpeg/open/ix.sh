{% extends 't/ix.sh' %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block cmake_flags %}
{{super()}}
BUILD_PKGCONFIG_FILES=ON
{% endblock %}

{% block install %}
{{super()}}
>${out}/lib/cmake/openjpeg-{{self.version()}}/OpenJPEGTargets.cmake
for i in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|bindir.*||' -i ${i}
done
{% endblock %}

{% block env %}
{{super()}}
{#
./base/sjpx_openjpeg.c:751:5: ?[0m?[0;1;35mwarning: ?[0m?[1m'OPJ_VERSION_MAJOR' is not defined, evaluates to 0 [-Wundef]?[0m
  751 | #if OPJ_VERSION_MAJOR >= 2 && OPJ_VERSION_MINOR >= 1
#}
export CPPFLAGS="-DOPJ_VERSION_MAJOR=2 -DOPJ_VERSION_MINOR=5 -I${out}/include/openjpeg-{{self.version()}} \${CPPFLAGS}"
{% endblock %}
