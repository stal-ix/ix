{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gitea
{% endblock %}

{% block version %}
1.24.4
{% endblock %}

{% block go_url %}
https://github.com/go-gitea/gitea/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
af37e3e9af5242911ea4fdd7af2cff8728e6f6434a0853dd313911b8fa32250a
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
gitea
{% endblock %}
