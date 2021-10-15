{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/lloyd/yajl/archive/refs/tags/2.1.0.tar.gz
# md5 6887e0ed7479d2549761a4d284d3ecb0
{% endblock %}

{% block deps %}
# bld dev/build/cmake env/std
{% endblock %}

{% block patch %}
sed -e 's| SHARED | STATIC |' -i src/CMakeLists.txt
{% endblock %}

{% block postinstall %}
rm ${out}/lib/libyajl_s.a
mv ${out}/share/pkgconfig ${out}/lib/
{% endblock %}
