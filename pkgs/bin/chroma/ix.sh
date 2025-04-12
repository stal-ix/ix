{% extends '//die/go/build.sh' %}

{% block version %}
2.13.0
{% endblock %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
429e7e69cc44a0aa28fcdbe6c321100614c7c74d3eef053c4cfdb09f7e7ec942
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
