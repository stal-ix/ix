{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/f81a7de45915af25b1ce5d8556929b17d896aa1d.zip
{% endblock %}

{% block go_sha %}
dea496a07dc6a29e5113cacad7d12179958218dd21c3eee25b9fb04086f8133a
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
