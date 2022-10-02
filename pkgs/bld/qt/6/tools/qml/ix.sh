{% extends '//lib/qt/6/declarative/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_qml_animation=OFF
QT_FEATURE_qml_debug=OFF
QT_FEATURE_qml_delegate_model=OFF
QT_FEATURE_qml_devtools=OFF
QT_FEATURE_qml_itemmodel=OFF
QT_FEATURE_qml_jit=OFF
QT_FEATURE_qml_list_model=OFF
QT_FEATURE_qml_locale=OFF
QT_FEATURE_qml_network=OFF
QT_FEATURE_qml_object_model=OFF
QT_FEATURE_qml_profiler=OFF
QT_FEATURE_qml_table_model=OFF
QT_FEATURE_qml_worker_script=ON
QT_FEATURE_qml_xml_http_request=OFF
QT_FEATURE_qml_xmllistmodel=OFF
{% endblock %}

{% block env %}
export Qt6QmlTools_DIR=${out}/lib/cmake/Qt6QmlTools
{% endblock %}

{% block postinstall %}
cd ${out}
mv lib old
mkdir -p lib/cmake
mv old/cmake/Qt6QmlTools lib/cmake/
rm -rf doc include plugins modules old qml
{% endblock %}
