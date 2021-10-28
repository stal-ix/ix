{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# bld lib/z boot/final/env/tools
{% endblock %}

{% block install %}
mkdir ${out}/bin && cd ${out}/bin

cp $(command -v minigzip) minigzip
ln -s minigzip gzip
{% endblock %}
