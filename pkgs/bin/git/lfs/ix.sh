{% extends '//die/go/build.sh' %}

{% block pkg_name %}
git-lfs
{% endblock %}

{% block version %}
3.8.1
{% endblock %}

{% block go_url %}
https://github.com/git-lfs/git-lfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1c222a224eb2ab05d91539861f2cb82afc04b77ea0abef4733320d25a59e19d2
{% endblock %}

{% block go_bins %}
git-lfs
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
