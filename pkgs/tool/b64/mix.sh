{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url http://base64.sourceforge.net/b64.c
# md5 b2294ff8b1cc1de89f7c9073ba866170
{% endblock %}

{% block deps %}
# bld env/c/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block unpack %}
{% endblock %}

{% block build %}
clang ${src}/b64.c -o base64
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp base64 ${out}/bin
{% endblock %}
