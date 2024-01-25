{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/g-truc/glm/archive/refs/tags/1.0.0.tar.gz
sha:e51f6c89ff33b7cfb19daafb215f293d106cd900f8d681b9b1295312ccadbd23
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=glm,pkg_ver=1.0.0)
{% endblock %}

{% block install %}
mkdir -p ${out}/include
cp -R glm ${out}/include/
{% endblock %}
