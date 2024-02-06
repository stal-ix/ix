{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/yaegashi/muslstack/archive/d19cc5866abce3ca59dfc1666df7cc97097d0933.zip
{% endblock %}

{% block go_sha %}
db461654ebf5ba9d2e8a10e34b3acc2b9b1abd5d951b8e0deefb6ce97ce82e38
{% endblock %}

{% block build %}
go build main.go
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp main ${out}/bin/muslstack
{% endblock %}
