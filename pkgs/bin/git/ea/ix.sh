{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gitea
{% endblock %}

{% block version %}
1.27.3
{% endblock %}

{% block go_url %}
https://github.com/go-gitea/gitea/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ed4ed50d8ad3c5b4e0b60bcdc5a93b2ee145564816ae690fc1846c1f75dd2dc0
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o gitea
{% endblock %}

{% block go_bins %}
gitea
{% endblock %}
