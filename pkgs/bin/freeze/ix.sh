{% extends '//die/go/build.sh' %}

{% block pkg_name %}
freeze
{% endblock %}

{% block version %}
0.2.2
{% endblock %}

{% block go_url %}
https://github.com/charmbracelet/freeze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2023ece2544396534b25f32538d09c1562234d9737731c92fd2542c5aa74a62a
{% endblock %}

{% block go_bins %}
freeze
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
