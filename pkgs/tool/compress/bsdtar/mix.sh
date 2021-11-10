{% extends '//mix/template/proxy.sh' %}

{% block bld_deps %}
lib/archive/mix.sh
env/std/0/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v bsdtar)) ./
{% endblock %}
