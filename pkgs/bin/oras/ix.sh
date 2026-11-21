{% extends '//die/go/build.sh' %}

{% block pkg_name %}
oras
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block go_url %}
https://github.com/oras-project/oras/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
91d4717ef70fab2685127ed7c058a8f36cf86d589df11a852531285781744b6e
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/oras
{% endblock %}

{% block go_bins %}
oras
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
