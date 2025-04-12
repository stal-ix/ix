{% extends '//die/c/ix.sh' %}

{% block version %}
1.63.1
{% endblock %}

{% block fetch %}
https://github.com/grpc/grpc-java/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:9a63053966eaee1af608f5ba898522d448ebc8fc31be277e861aa3c45dec966f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/protoc
{% endblock %}

{% block unpack %}
{{super()}}
cd compiler/src/java_plugin/cpp
{% endblock %}

{% block build %}
c++ *.cpp -o grpc_java
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp grpc_java{{target.exe_suffix}} ${out}/bin/
{% endblock %}
