{% extends '//mix/template/proxy.sh' %}

{% block bld_libs %}
lib/z/mix.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin && cd ${out}/bin

cp $(command -v minigzip) minigzip
ln -s minigzip gzip
{% endblock %}
