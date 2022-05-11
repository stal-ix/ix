{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/Exiv2/exiv2/releases/download/v0.27.5/exiv2-0.27.5-Source.tar.gz
sha:35a58618ab236a901ca4928b0ad8b31007ebdc0386d904409d825024e45ea6e2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/expat
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cmake_flags %}
EXIV2_BUILD_SAMPLES=OFF
{% endblock %}

{% block install1 %}
{{super()}}
find ${out}/include -name '*.hpp' | while read l; do
    sed -e 's|std::auto_ptr|auto_ptr|' -i ${l}
done
{% endblock %}
