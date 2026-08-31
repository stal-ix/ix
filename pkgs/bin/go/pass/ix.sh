{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gopass
{% endblock %}

{% block version %}
1.17.0
{% endblock %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b6c2906afdfdc952d1cd4f76ff0c60d28cdb669fef69a9b25d9e1f3b13c12d83
{% endblock %}

{% block go_bins %}
gopass
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
