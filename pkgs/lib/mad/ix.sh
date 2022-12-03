{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/tenacityteam/libmad/archive/refs/tags/0.16.3.tar.gz
sha:83ca48db60f480ae22234bae08e6ad651adec2667a68ad2df6fd61e6a50a32c7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib/pkgconfig
ln -s libmad.pc mad.pc
{% endblock %}

{% block test %}
# for vkquake
test -f ${out}/lib/pkgconfig/mad.pc
{% endblock %}
