{% extends '//bld/qt/6/tools/qml/t/ix.sh' %}

{% block ninja_build_targets %}
bin/qmltyperegistrar
{% endblock %}

{% block ninja_install_targets %}
src/qmltyperegistrar/install
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|$<T.*qmltyperegistrar>|qmltyperegistrar|' \
    -e 's|$<T.*cachegen_name}>|qmlcachegen|' \
    -i src/qml/Qt6QmlMacros.cmake
{% endblock %}

{% block postinstall %}
mkdir -p ${out}/lib/cmake
cp -R ${tmp}/obj/lib/cmake/Qt6QmlTools ${out}/lib/cmake/
sed -e "s|/.*/obj/bin|${out}/bin|" -i ${out}/lib/cmake/Qt6QmlTools/Qt6QmlToolsTargets.cmake
{% endblock %}
