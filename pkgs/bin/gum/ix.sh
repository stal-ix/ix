{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gum
{% endblock %}

{% block version %}
2.0.0
{% endblock %}

{% block go_url %}
https://github.com/charmbracelet/gum/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
89284d3d33109faee18f84bc470980a9a99044b18214f8da85058da0691d23ba
{% endblock %}

{% block go_bins %}
gum
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
