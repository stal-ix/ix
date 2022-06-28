{% extends '//die/fonts.sh' %}

{% block fetch %}
https://github.com/rsms/inter/releases/download/v3.19/Inter-3.19.zip
sha:150ab6230d1762a57bebf35dfc04d606ff91598a31d785f7f100356ecdcc0032
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 0 ${src}/Inter*
cd "Inter Desktop"
{% endblock %}
