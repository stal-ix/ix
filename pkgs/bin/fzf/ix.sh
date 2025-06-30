{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fzf
{% endblock %}

{% block version %}
0.63.0
{% endblock %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
df8554efc9d998bc429ba4e7799d98a5a5d8811c7e3898d57fb3f3c65eb3bc2e
{% endblock %}

{% block go_bins %}
fzf
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
