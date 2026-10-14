{# impulse-desktop/svg: an SVG renderer in one C++17 source behind a C
   header, svg.h. The release asset carries the library's files alone;
   the repository's archive would bring its test corpus along. #}

{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
svg
{% endblock %}

{% block version %}
2
{% endblock %}

{% block fetch %}
https://github.com/impulse-desktop/svg/releases/download/{{self.version().strip()}}/svg-{{self.version().strip()}}.tar.gz
180f694c821c72e98d81cd54eca688d302df2faaf23fcf9c8e7d532f9d3f5053
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cxx_flags %}
-std=c++17
{% endblock %}

{% block build %}
${CXX} ${CPPFLAGS} ${CXXFLAGS} -c svg.cpp -o svg.o
${AR} rcs libsvg.a svg.o
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/include
cp libsvg.a ${out}/lib/
cp svg.h ${out}/include/
{% endblock %}
