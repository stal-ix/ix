{% extends '//mix/template/proxy.sh' %}

{% block bld_tool %}
lib/bzip2/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v bzip2)) ./
{% endblock %}
