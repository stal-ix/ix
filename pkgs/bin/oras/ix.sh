{% extends '//die/go/build.sh' %}

{% block pkg_name %}
oras
{% endblock %}

{% block version %}
1.3.4
{% endblock %}

{% block go_url %}
https://github.com/oras-project/oras/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
699de1a267d2b63b04ccc2798c99f8a9abdeda4eeb148315dc12502be844c032
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/oras
{% endblock %}

{% block go_bins %}
oras
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
