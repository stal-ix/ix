{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# bld lib/curl/package.sh
# bld env/std/package.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v curl)) ./
{% endblock %}
