{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hugo
{% endblock %}

{% block version %}
0.147.2
{% endblock %}

{% block go_url %}
https://github.com/gohugoio/hugo/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5b7eafdaa44cdcc87823f48739e0c35fd7aa59c58773f8a3445d4aa8b26bfb68
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp hugo ${out}/bin/
{% endblock %}
