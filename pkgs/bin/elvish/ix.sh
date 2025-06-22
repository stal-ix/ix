{% extends '//die/go/build.sh' %}

{% block pkg_name %}
elvish
{% endblock %}

{% block version %}
0.21.0
{% endblock %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e89800f0c41135b1a7b7717036fa47e4e4ef6f99d38863d89ccd71de16bf60f6
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block go_bins %}
elvish
{% endblock %}
