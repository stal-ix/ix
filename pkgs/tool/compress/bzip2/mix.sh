{% extends '//mix/template/proxy.sh' %}

{% block bld_deps %}
lib/bzip2/mix.sh
env/std/0/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v bzip2)) ./
{% endblock %}
