{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/3a99d108518d46ee46732ef7b7b62e46df70440e.zip
{% endblock %}

{% block go_sha %}
f55cbc1d3a6e4c7842bb7f694c296685f172660c0541545701e357b34838f2d1
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
