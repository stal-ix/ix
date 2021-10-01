{% extends '//util/base.sh' %}

{% block deps %}
# bld lib/z boot/final/env/tools
{% endblock %}

{% block install %}
mkdir ${out}/bin && cd ${out}/bin

cp $(which minigzip) minigzip
ln -s minigzip gzip
{% endblock %}
