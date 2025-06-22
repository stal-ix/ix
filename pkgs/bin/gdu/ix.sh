{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gdu
{% endblock %}

{% block version %}
5.31.0
{% endblock %}

{% block go_url %}
https://github.com/dundee/gdu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3c4cd5369f2390b282f6837a742cabc1ac602e21696c2d982a31274242c74781
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gdu
{% endblock %}

{% block go_bins %}
gdu
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
