{% extends '//die/go/build.sh' %}

{% block pkg_name %}
act
{% endblock %}

{% block version %}
0.2.87
{% endblock %}

{% block go_url %}
https://github.com/nektos/act/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
635a4794bbdaea5ecc9436963183fc460925d2753d3554e126affdf326e90df3
{% endblock %}

{% block go_bins %}
act
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
