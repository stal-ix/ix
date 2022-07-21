{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://s3.amazonaws.com/json-c_releases/releases/json-c-0.16.tar.gz
sha:8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block c_rename_symbol %}
#json_object_get_type
json_object_equal
{% endblock %}
