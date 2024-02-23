{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/yaegashi/muslstack/archive/d19cc5866abce3ca59dfc1666df7cc97097d0933.zip
{% endblock %}

{% block go_sha %}
0d3778e50de950609bdef10a71ef4710fb973ed1004f18a1c83fed0f3b520cb5
{% endblock %}

{% block build %}
go build main.go
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp main ${out}/bin/muslstack
{% endblock %}
