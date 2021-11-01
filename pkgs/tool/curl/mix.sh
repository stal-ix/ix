{% extends '//mix/template/proxy.sh' %}

{% block bld_deps %}
lib/curl/mix.sh
env/std/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v curl)) ./
{% endblock %}
