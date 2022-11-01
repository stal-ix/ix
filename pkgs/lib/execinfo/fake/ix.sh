{% extends '//die/inline/library.sh' %}

{% block sources %}
execinfo.c
execinfo.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv *.a libexecinfo.a
{% endblock %}
