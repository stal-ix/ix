{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kcachegrind
{% endblock %}

{% block version %}
26.08.2
{% endblock %}

{% block fetch %}
https://github.com/KDE/kcachegrind/archive/refs/tags/v{{self.version().strip()}}.tar.gz
79af2c9d021e83a8e03291ae89b7b762bc93e77df64f1751bf4493f8f0fa3979
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/k/ecm
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
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
