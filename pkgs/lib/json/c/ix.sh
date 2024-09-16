{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://s3.amazonaws.com/json-c_releases/releases/json-c-0.18.tar.gz
sha:876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724
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
