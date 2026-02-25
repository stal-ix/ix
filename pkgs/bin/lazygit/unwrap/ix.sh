{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazygit
{% endblock %}

{% block version %}
0.59.0
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
502df8def51fafe59d3c35b7d8ac7e90c67e00ee0567e76269825a6c02feca07
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_bins %}
lazygit
{% endblock %}
