{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hysteria
{% endblock %}

{% block version %}
2.6.1
{% endblock %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
056941e5f0e003fa0a8450e845404ad85398d8503abdaef1c29b942e8064db5c
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp app ${out}/bin/hysteria
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}
