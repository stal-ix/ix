{% extends '//die/go/build.sh' %}

{% block version %}
5.28.0
{% endblock %}

{% block go_url %}
https://github.com/dundee/gdu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
476822848c570eb7bdc9df700db97755e463490104dd013024b98bad2f815be3
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gdu
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gdu ${out}/bin/
{% endblock %}
