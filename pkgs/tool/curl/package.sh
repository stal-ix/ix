{% extends '//mix/template/base.sh' %}

{% block deps %}
# bld lib/curl env/std
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(which curl)) ./
{% endblock %}
