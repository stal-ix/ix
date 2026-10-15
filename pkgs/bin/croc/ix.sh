{% extends '//die/go/build.sh' %}

# noauto

{% block pkg_name %}
croc
{% endblock %}

{% block version %}
9.6.9
{% endblock %}

{% block go_url %}
https://github.com/schollz/croc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9fc1e50fdbf50b4bf21741f24ae8896d0530904894beb92a6b8b6c62a23ed570
{% endblock %}

{% block go_bins %}
croc
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
