{% extends '//lib/qt/6/declarative/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/qt/6/tools/qml
{% endblock %}

{% block cpp_defines %}
{{super()}}
QT_STATICPLUGIN=1
{% endblock %}

{% block postinstall %}
find ${out}/ -type f -name '*.a' | grep -v '/lib/' | while read l; do
    cp ${l} ${out}/lib/
done
cd ${out}/lib/
llvm-ar q libqtqmlregister.a $(find -type f -name '*.o')
{% endblock %}
