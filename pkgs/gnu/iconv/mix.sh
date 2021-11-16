{% extends '//mix/template/proxy.sh' %}

{% block bld_libs %}
lib/iconv/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v iconv)) ./
{% endblock %}
