{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/google/brotli/archive/refs/tags/v1.0.9.tar.gz
c2274f0c7af8470ad514637c35bcee7d
{% endblock %}

{% if kind == 'lib' %}
{% block std_box %}
box/boot/mix.sh
{% endblock %}
{% endif %}

{% block cmake_flags %}
BROTLI_SHARED_LIBS=
BROTLI_DISABLE_TESTS=ON
{% endblock %}

{% block patch %}
sed -e 's| SHARED | STATIC |' -i CMakeLists.txt
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/lib*static*
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}
