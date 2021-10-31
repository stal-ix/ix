{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# bld lib/xz/package.sh
# bld env/tools/package.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v xz)) ./
{% endblock %}
