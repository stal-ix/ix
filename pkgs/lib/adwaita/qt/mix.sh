{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/FedoraQt/adwaita-qt/archive/refs/tags/1.4.1.tar.gz
sha:834f2caaf031306b63b31ad6fec489482feda35e9aa260f205cbb976cde97b1d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block cmake_flags %}
USE_QT6=ON
{% endblock %}

{% block install %}
{{super()}}
cd ${out}

cp plugins/styles/adwaita.a lib/libadwaitaplug.a

for x in lib/*.a; do
    llvm-objcopy --localize-symbol=_Z7ADWAITAv ${x}
done
{% endblock %}

{% block cpp_defines %}
QT_STATICPLUGIN=1
{% endblock %}
