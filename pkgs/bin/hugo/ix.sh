{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hugo
{% endblock %}

{% block version %}
0.146.6
{% endblock %}

{% block go_url %}
https://github.com/gohugoio/hugo/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
17e962ec8509da4f44bdaf69bfb4d8421e8ec450b943f10cc7514bd09a0a7b26
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp hugo ${out}/bin/
{% endblock %}
