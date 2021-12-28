{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://github.com/v8/v8/archive/refs/tags/9.7.37.tar.gz
3f48a781bbad3f531720d2b7898f68aa
{% endblock %}

{% block lib_deps %}
lib/c++
{% endblock %}

{% block bld_tool %}
dev/build/gn
dev/tool/python
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract ${src}/*.tar.gz
{% endblock %}

{% block build %}
exit 1
{% endblock %}
