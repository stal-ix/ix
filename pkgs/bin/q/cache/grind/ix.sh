{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kcachegrind
{% endblock %}

{% block version %}
24.04.80
{% endblock %}

{% block fetch %}
https://github.com/KDE/kcachegrind/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b6482fe45ff9fe976845499b9f833e5ea8544eb63ecebb9a1b428cb4e8a982e9
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/k/ecm
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block patch %}
base64 -d << EOF > CMakeLists.txt
{% include 'CMakeLists.txt/base64' %}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/bin/qcachegrind ${out}/bin/
{% endblock %}
