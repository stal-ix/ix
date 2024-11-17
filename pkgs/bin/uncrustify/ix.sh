{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/uncrustify/uncrustify/archive/refs/tags/uncrustify-0.80.1.tar.gz
sha:0e2616ec2f78e12816388c513f7060072ff7942b42f1175eb28b24cb75aaec48
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}
