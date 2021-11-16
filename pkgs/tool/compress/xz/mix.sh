{% extends '//mix/template/proxy.sh' %}

{% block bld_libs %}
lib/xz/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v xz)) ./
{% endblock %}
