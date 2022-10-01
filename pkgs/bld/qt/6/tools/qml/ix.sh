{% extends '//lib/qt/6/declarative/t/ix.sh' %}

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
