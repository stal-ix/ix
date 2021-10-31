{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# bld lib/z/package.sh
# bld boot/final/env/tools/package.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin && cd ${out}/bin

cp $(command -v minigzip) minigzip
ln -s minigzip gzip
{% endblock %}
