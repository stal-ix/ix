{% extends '//die/c/ix.sh' %}

{% block fetch %}
http://base64.sourceforge.net/b64.c
md5:b2294ff8b1cc1de89f7c9073ba866170
{% endblock %}

{% block unpack %}
:
{% endblock %}

{% block build %}
${CC} ${src}/b64.c -o base64
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp base64 ${out}/bin
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
