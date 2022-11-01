{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block sources %}
execinfo.cpp
execinfo.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv *.a libexecinfo.a
{% endblock %}
