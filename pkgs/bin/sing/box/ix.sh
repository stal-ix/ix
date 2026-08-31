{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sing-box
{% endblock %}

{% block version %}
1.14.0
{% endblock %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d57c67a831f85e9029332ecbb62e8aa3fc3dcf5c040f7fadf8fa3320b3001b7f
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
