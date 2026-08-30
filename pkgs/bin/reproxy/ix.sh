{% extends '//die/go/build.sh' %}

{% block pkg_name %}
reproxy
{% endblock %}

{% block version %}
1.7.1
{% endblock %}

{% block go_url %}
https://github.com/umputun/reproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
79f95370e1d53cde9ef6396473fe47e8bf27b68924a597a343314bbb74054e46
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block go_bins %}
app
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/app ${out}/bin/reproxy
{% endblock %}
