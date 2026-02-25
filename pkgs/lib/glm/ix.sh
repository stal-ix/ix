{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
glm
{% endblock %}

{% block version %}
1.0.3
{% endblock %}

{% block fetch %}
https://github.com/g-truc/glm/archive/refs/tags/{{self.version().strip()}}.tar.gz
6775e47231a446fd086d660ecc18bcd076531cfedd912fbd66e576b118607001
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=glm,pkg_ver={{self.version().strip()}})
{% endblock %}

{% block install %}
mkdir -p ${out}/include
cp -R glm ${out}/include/
{% endblock %}
