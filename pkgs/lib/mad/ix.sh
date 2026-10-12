{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libmad
{% endblock %}

{% block version %}
0.16.5
{% endblock %}

{% block fetch %}
https://codeberg.org/tenacityteam/libmad/archive/{{self.version().strip()}}.tar.gz
e32320a010e3cc00bfa66e0cde523a969313cddfd81e07ec4e3ef06d10ad3fe0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block test %}
# for vkquake
test -f ${out}/lib/pkgconfig/mad.pc
{% endblock %}
