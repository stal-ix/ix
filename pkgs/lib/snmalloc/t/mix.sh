{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/snmalloc/archive/refs/tags/0.5.3.tar.gz
sha:0985e188bac5c69a39d5f5015debab4c19511b633067b577ef167e37d7468661
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
lib/c++/headers
{% endblock %}

{% block patch %}
rm -rf src/test/func
rm -rf src/test/perf
sed -e 's| SHARED | STATIC |g' -i CMakeLists.txt
{% endblock %}

{% block install %}
mkdir ${out}/lib

find ${tmp} -name '*.a' | grep -v static | grep {% block kind %}{% endblock %} | while read l; do
    cp ${l} ${out}/lib/
done
{% endblock %}
