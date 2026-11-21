{% extends '//die/go/build.sh' %}

{% block pkg_name %}
superfile
{% endblock %}

{% block version %}
1.6.1
{% endblock %}

{% block go_url %}
https://github.com/yorukot/superfile/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
fd04da705d44d57f7ef6fe28a69796c65bafc90c598f9f915f14c036ce1ff454
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_bins %}
superfile
{% endblock %}
