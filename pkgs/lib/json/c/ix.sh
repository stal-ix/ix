{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://s3.amazonaws.com/json-c_releases/releases/json-c-0.17.tar.gz
sha:7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block c_rename_symbol %}
json_object_equal
{% endblock %}

{% block patch %}
sed -e 's|*json_util_get_last_err()|*json_util_get_last_err(void)|' -i json_util.c
{% endblock %}
