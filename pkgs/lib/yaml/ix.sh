{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/yaml/libyaml/archive/refs/tags/0.2.5.tar.gz
sha:fa240dbf262be053f3898006d502d514936c818e422afdcf33921c63bed9bf2e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
