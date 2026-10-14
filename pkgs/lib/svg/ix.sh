{# impulse-desktop/svg: an SVG renderer in one C++17 source behind a C
   header, svg.h. The release asset carries the library's files alone;
   the repository's archive would bring its test corpus along. #}

{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
svg
{% endblock %}

{% block version %}
1
{% endblock %}

{% block fetch %}
https://github.com/impulse-desktop/svg/releases/download/{{self.version().strip()}}/svg-{{self.version().strip()}}.tar.gz
0eff2b7e5abf92e68b6eb07c04be27a9dcc4970edc4555b17ee32796149125c2
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
