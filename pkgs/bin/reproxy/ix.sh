{% extends '//die/go/build.sh' %}

{% block pkg_name %}
reproxy
{% endblock %}

{% block version %}
1.2.3
{% endblock %}

{% block go_url %}
https://github.com/umputun/reproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
cf1b2a889aa50c05a49309aa438d17ca0206565c1677d0f37a1d6114f44ce2a3
{% endblock %}

{% block go_tool %}
bin/go/lang/23
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
