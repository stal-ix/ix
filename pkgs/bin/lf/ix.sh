{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lf
{% endblock %}

{% block version %}
37
{% endblock %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7ecb5b66fed1d55cab0a6a71cf5f1ff1c3b15ae1944a8952072e17a2961f89ae
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
lf
{% endblock %}
