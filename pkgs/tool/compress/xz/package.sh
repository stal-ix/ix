{% extends '//util/base.sh' %}

{% block deps %}
# bld lib/xz env/tools
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(which xz)) ./
{% endblock %}
