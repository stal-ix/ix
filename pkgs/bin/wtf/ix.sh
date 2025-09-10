{% extends '//die/go/build.sh' %}

{% block pkg_name %}
wtf
{% endblock %}

{% block version %}
0.46.1
{% endblock %}

{% block go_url %}
https://github.com/wtfutil/wtf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c0e7b311a2fe51d847ea8ad7032d1cb5a784513dd8de13b84c68878c749b29c7
{% endblock %}

{% block go_build_flags %}
-o wtfutil
{% endblock %}

{% block go_bins %}
wtfutil
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
