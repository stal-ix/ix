{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gh-dash
{% endblock %}

{% block version %}
4.9.1
{% endblock %}

{% block go_url %}
https://github.com/dlvhdr/gh-dash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3ee3ceb1fa69ca165a9513e8b16f770a646ba261a621028833bdf06836fa6872
{% endblock %}

{% block go_bins %}
gh-dash
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
