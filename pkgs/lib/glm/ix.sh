{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
glm
{% endblock %}

{% block version %}
1.0.2
{% endblock %}

{% block fetch %}
https://github.com/g-truc/glm/archive/refs/tags/{{self.version().strip()}}.tar.gz
19edf2e860297efab1c74950e6076bf4dad9de483826bc95e2e0f2c758a43f65
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
