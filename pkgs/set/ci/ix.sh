{% extends '//die/hub.sh' %}

{% block run_deps %}
set/ci/tier/0
set/ci/tier/1
set/ci/tier/2
# for repology
lib/fmt/11
lib/botan/3
lib/json/nlohmann/12
{% endblock %}
