{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
json-c
{% endblock %}

{% block version %}
0.19
{% endblock %}

{% block fetch %}
https://s3.amazonaws.com/json-c_releases/releases/json-c-{{self.version().strip()}}.tar.gz
37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b5900aad9ce564e26de
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_APPS=OFF
{% endblock %}

{% block c_rename_symbol %}
json_object_equal
{% endblock %}

{% block patch %}
sed -e 's|*json_util_get_last_err()|*json_util_get_last_err(void)|' -i json_util.c
{% endblock %}
