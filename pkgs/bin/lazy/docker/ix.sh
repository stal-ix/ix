{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazydocker
{% endblock %}

{% block version %}
0.25.0
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazydocker/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0ed8deb041cf78bde38aaef07ca17332538127ebc5173817304b3a2bf8c29f13
{% endblock %}

{% block go_bins %}
lazydocker
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
