{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# bld lib/bzip2/mix.sh
# bld env/tools/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v bzip2)) ./
{% endblock %}
