{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsx
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/dnsx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b4b2d8505c2be30181060a05f126a90ef5211c489fa437236172046b38c6ce3b
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dnsx
{% endblock %}

{% block go_bins %}
dnsx
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
