{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sing-box
{% endblock %}

{% block version %}
1.12.9
{% endblock %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7265e4ad24f3594b175dd9b50e53349665b4e0d2ea7c9a34d214617dcc373355
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
