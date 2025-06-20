{% extends '//die/go/build.sh' %}

{% block pkg_name %}
reproxy
{% endblock %}

{% block version %}
1.2.3
{% endblock %}

{% block go_url %}
https://github.com/umputun/reproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1adc0e896ca52d5c09007f56cfaf05f2db45e7f975a6457c78ba3961f533feb7
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block go_bins %}
app
{% endblock %}
