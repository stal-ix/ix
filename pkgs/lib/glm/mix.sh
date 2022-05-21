{% extends '//die/c_std.sh' %}

{% block fetch %}
https://github.com/g-truc/glm/archive/refs/tags/0.9.9.8.tar.gz
sha:7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
mkdir -p ${out}/include
cp -R glm ${out}/include/
{{hooks.gen_pc('glm', '0.9.9.8')}}
{% endblock %}
