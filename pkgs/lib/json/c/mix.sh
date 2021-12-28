{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://s3.amazonaws.com/json-c_releases/releases/json-c-0.15.tar.gz
55f395745ee1cb3a4a39b41636087501
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block c_rename_symbol %}
#json_object_get_type
json_object_equal
{% endblock %}
