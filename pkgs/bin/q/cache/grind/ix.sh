{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kcachegrind
{% endblock %}

{% block version %}
26.08.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/kcachegrind/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6a64aec45e52641561592236ea9158f33f4276768ae9ab453eb57c3c59b06b65
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
