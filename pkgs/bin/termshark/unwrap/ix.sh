{% extends '//die/go/build.sh' %}

{% block version %}
2.4.0
{% endblock %}

{% block go_url %}
https://github.com/gcla/termshark/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2cd6d34adfcd2545553a4daa36a9c5fea7b588f3189bd7c052c23db627cebb87
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/termshark
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp termshark ${out}/bin/
{% endblock %}
