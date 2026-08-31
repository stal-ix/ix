{% extends '//die/go/build.sh' %}

{% block pkg_name %}
restic
{% endblock %}

{% block version %}
0.19.1
{% endblock %}

{% block go_url %}
https://github.com/restic/restic/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2387d204262a61cf54f577b231ff6af00fcb2f53a06c439182336bf65a94e3f6
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/restic
{% endblock %}

{% block go_bins %}
restic
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
