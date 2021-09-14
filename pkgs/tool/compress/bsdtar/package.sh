{% extends '//util/base.sh' %}

{% block deps %}
# bld lib/archive env/tools
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(which bsdtar)) ./
{% endblock %}
