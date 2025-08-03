{% extends '//die/go/build.sh' %}

{% block pkg_name %}
superfile
{% endblock %}

{% block version %}
1.3.3
{% endblock %}

{% block go_url %}
https://github.com/yorukot/superfile/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
184a8c7a5a703089cf93545c07f60718a78efc95cb4c5aeccc21385a35bd06fb
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
superfile
{% endblock %}
