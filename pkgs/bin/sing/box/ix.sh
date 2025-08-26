{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sing-box
{% endblock %}

{% block version %}
1.12.3
{% endblock %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
8148de6b56064d916933cd44b8c0bb533e9b901612033dad6af6cc964058ac3a
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/sing-box
{% endblock %}

{% block go_bins %}
sing-box
{% endblock %}


{% block go_tool %}
bin/go/lang/24
{% endblock %}
