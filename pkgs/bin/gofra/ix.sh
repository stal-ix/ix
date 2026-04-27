{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block version %}
d4ec9902420bcdba36f7c65504da84498cf91f20
{% endblock %}

{% block go_url %}
https://github.com/pg83/gofra/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
285c0f16698e3f330874bc72c1a4d121da85fe06a43697c224e05e00e91791d5
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin
{% endblock %}
