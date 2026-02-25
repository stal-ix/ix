{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hysteria
{% endblock %}

{% block version %}
2.7.0
{% endblock %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ac3e6695d8b11217eb797ac7bc5293bb90b7c10480b1add195d28909c1e98c4c
{% endblock %}

{% block go_tool %}
bin/go/lang/25
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
