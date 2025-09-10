{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sing-box
{% endblock %}

{% block version %}
1.12.4
{% endblock %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a2eb96a800c3d1cf46f43f4631368bc79012b92ff90a7663f2ee7a7d654c3502
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
