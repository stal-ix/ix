{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hysteria
{% endblock %}

{% block version %}
2.12.2
{% endblock %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
8309537d7afa776e87463fc3c1969ef0bb483d6651522bb0b77de6a642a6a9ad
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

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/app ${out}/bin/hysteria
{% endblock %}
