{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gum
{% endblock %}

{% block version %}
2.0.2
{% endblock %}

{% block go_url %}
https://github.com/charmbracelet/gum/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d639752f30cdf855582b4464e6ddb8df681653bc66fe500e4a681afe8716b42b
{% endblock %}

{% block go_bins %}
gum
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
