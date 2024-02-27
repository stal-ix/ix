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
for i in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|bindir.*||' -i ${i}
done
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/openjpeg-{{self.version()[:3]}} \${CPPFLAGS}"
{% endblock %}
