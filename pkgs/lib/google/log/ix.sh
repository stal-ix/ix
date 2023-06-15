{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/glog/archive/refs/tags/v0.6.0.tar.gz
sha:8a83bf982f37bb70825df71a9709fa90ea9f4447fb3c099e1d720a439d88bad6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*/bin.*||' -i ${out}/lib/pkgconfig/libglog.pc
{% endblock %}
