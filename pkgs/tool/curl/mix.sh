{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# bld lib/curl/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v curl)) ./
{% endblock %}
