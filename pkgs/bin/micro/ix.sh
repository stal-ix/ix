{% extends '//die/go/build.sh' %}

{% block version %}
2.0.14
{% endblock %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b4ea01909023fea11fe66faf4b8a14d170e22dfb2bd3d6f326b66902eb618ddb
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}
