{% extends '//die/hub.sh' %}

{% block run_deps %}
pip/toml
bld/python
bld/devendor
bld/rust/helpers/cc
bld/rust/helpers/reconf
bld/rust/helpers/devendor
{% endblock %}
