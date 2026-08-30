{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sing-box
{% endblock %}

{% block version %}
1.13.21
{% endblock %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
61c101951af366dbd3c0a4a824840c4d5a83ed81b9aa8449d8b47fb43e6b7d89
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/sing-box
{% endblock %}

{% block go_bins %}
sing-box
{% endblock %}


{% block go_tool %}
bin/go/lang/26
{% endblock %}
