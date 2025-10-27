{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hysteria
{% endblock %}

{% block version %}
2.6.5
{% endblock %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
73f686cee88dc05e0d0cb558177f359c163bb34aaa67bd4c50b3540520511911
{% endblock %}

{% block go_tool %}
bin/go/lang/24
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
