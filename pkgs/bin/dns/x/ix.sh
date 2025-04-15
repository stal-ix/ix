{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsx
{% endblock %}

{% block version %}
1.2.2
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/dnsx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a08515029243cc464da5cca0ff36df1432c94b278bda62e45d31bbb99dcaf1fa
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dnsx
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dnsx ${out}/bin/
{% endblock %}
