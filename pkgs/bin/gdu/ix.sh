{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gdu
{% endblock %}

{% block version %}
5.32.0
{% endblock %}

{% block go_url %}
https://github.com/dundee/gdu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
316acaf432075a8c0bd1233641837bd5160704e309d5ed4d0e5ec6ca8d24678f
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gdu
{% endblock %}

{% block go_bins %}
gdu
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
