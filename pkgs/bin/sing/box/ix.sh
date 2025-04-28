{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sing-box
{% endblock %}

{% block version %}
1.11.9
{% endblock %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f85e76d32e376bfbb186831d6238057a279cd8355608ebd30890700cffd2ac2f
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/sing-box
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sing-box ${out}/bin/
{% endblock %}


{% block go_tool %}
bin/go/lang/24
{% endblock %}
