{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/AdguardTeam/dnsproxy/archive/refs/tags/v0.75.1.tar.gz
{% endblock %}

{% block go_sha %}
daa98f81d0ce6b53589b5778709bc0808decfb3a08670fe6ce5a2128b9043ce3
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dnsproxy ${out}/bin/
{% endblock %}
