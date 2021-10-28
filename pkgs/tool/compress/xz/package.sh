{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# bld lib/xz env/tools
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v xz)) ./
{% endblock %}
