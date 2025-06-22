{% extends '//die/go/build.sh' %}

{% block pkg_name %}
oras
{% endblock %}

{% block version %}
1.2.3
{% endblock %}

{% block go_url %}
https://github.com/oras-project/oras/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5b2bb5782ca86ef469cfb9d15d59fb2f59ee5426588bb6b2fb858ea3b9fb2bda
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/oras
{% endblock %}

{% block go_bins %}
oras
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
