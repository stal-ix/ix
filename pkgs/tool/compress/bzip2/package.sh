{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# bld lib/bzip2/package.sh
# bld env/tools/package.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v bzip2)) ./
{% endblock %}
