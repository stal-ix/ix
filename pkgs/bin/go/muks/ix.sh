{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gomuks
{% endblock %}

{% block version %}
26.08
{% endblock %}

{% block go_url %}
https://github.com/tulir/gomuks/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b110bfe7b8d9da89bcf085b68251c44d50201ff9f169842ef6d110f6ab24d201
{% endblock %}

{% block bld_libs %}
lib/olm
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block go_bins %}
gomuks
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
