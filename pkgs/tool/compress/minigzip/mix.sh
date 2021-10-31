{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# bld lib/z/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin && cd ${out}/bin

cp $(command -v minigzip) minigzip
ln -s minigzip gzip
{% endblock %}
