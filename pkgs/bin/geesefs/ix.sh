{% extends '//die/go/build.sh' %}

{% block pkg_name %}
geesefs
{% endblock %}

{% block version %}
0.43.0
{% endblock %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
077436145a9d3684dd1c73748f0398b1f0a5a63133dc599620dd56a007b5f43b
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp geesefs ${out}/bin/
{% endblock %}
