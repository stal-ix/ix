{% extends '//die/go/build.sh' %}

{% block pkg_name %}
glow
{% endblock %}

{% block version %}
2.1.1
{% endblock %}

{% block go_url %}
https://github.com/charmbracelet/glow/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1c95500e7f1313f684d0af1ddb53a7616e12b264cdcf5b498c53b5c1cd1d991d
{% endblock %}

{% block go_bins %}
glow
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
