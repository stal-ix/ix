{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gendesk
{% endblock %}

{% block version %}
1.0.9
{% endblock %}

{% block go_url %}
https://github.com/xyproto/gendesk/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1441a2f11499fc6bdb6b61ec9be3d25fca3ea7bb42981cca364193b96fd2ca26
{% endblock %}

{% block go_bins %}
gendesk
{% endblock %}
