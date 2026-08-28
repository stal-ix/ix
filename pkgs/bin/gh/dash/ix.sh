{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gh-dash
{% endblock %}

{% block version %}
4.25.2
{% endblock %}

{% block go_url %}
https://github.com/dlvhdr/gh-dash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
62d2412c9dae90de991a06adcd9cd9170b662f2ed6c9051cda5bcdd1bfaa7b03
{% endblock %}

{% block go_bins %}
gh-dash
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
