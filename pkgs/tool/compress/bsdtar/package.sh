{% extends '//mix/template/proxy.sh' %}

{% block sh_script_begin %}
export OSX_SDK=
{% endblock %}

{% block deps %}
# bld lib/archive/package.sh
# bld env/tools/package.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v bsdtar)) ./
{% endblock %}
