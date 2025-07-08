{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazygit
{% endblock %}

{% block version %}
0.53.0
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
6aee222a5c77dbd382f38209f8d01dffeaabedab01dc5476653078991519b9c4
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
lazygit
{% endblock %}
