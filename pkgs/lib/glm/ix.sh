{% extends '//die/c/ix.sh' %}

{% block version %}
1.0.1
{% endblock %}

{% block fetch %}
https://github.com/g-truc/glm/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:9f3174561fd26904b23f0db5e560971cbf9b3cbda0b280f04d5c379d03bf234c
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
