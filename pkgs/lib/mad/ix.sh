{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://codeberg.org/tenacityteam/libmad/archive/0.16.3.tar.gz
sha:228bc0ea47d22ee70c087e7289e2c620829204972c9fe6ea8951ecf6c39d8966
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
