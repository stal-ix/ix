{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hysteria
{% endblock %}

{% block version %}
2.14.0
{% endblock %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
07baa0568e4e6aec945816428b7b849f87c2fbf9014f956620ba77572e602547
{% endblock %}

{% block go_tool %}
bin/go/lang/27
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
