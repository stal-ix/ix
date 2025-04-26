{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hugo
{% endblock %}

{% block version %}
0.147.0
{% endblock %}

{% block go_url %}
https://github.com/gohugoio/hugo/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f42c47ff06383e97e8fdeb36d8dbdb53c082b8634c2930b862c26964198a7c1e
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp hugo ${out}/bin/
{% endblock %}
