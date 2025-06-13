{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libmad
{% endblock %}

{% block version %}
0.16.4
{% endblock %}

{% block fetch %}
https://codeberg.org/tenacityteam/libmad/archive/{{self.version().strip()}}.tar.gz
f4eb229452252600ce48f3c2704c9e6d97b789f81e31c37b0c67dd66f445ea35
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block test %}
# for vkquake
test -f ${out}/lib/pkgconfig/mad.pc
{% endblock %}
