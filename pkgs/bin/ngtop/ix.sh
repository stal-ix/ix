{% extends '//die/go/build.sh' %}

{% block pkg_name %}
ngtop
{% endblock %}

{% block version %}
0.4.6
{% endblock %}

{% block go_url %}
https://github.com/facundoolano/ngtop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
adbb3715366df3f5ba6a52738fcecd10418758892ba116e16807a2071f7344b4
{% endblock %}

{% block patch %}
mv ngtop ngtop_pkg
sed -i 's|"github.com/facundoolano/ngtop/ngtop"|"github.com/facundoolano/ngtop/ngtop_pkg"|' main.go
{% endblock %}

{% block go_bins %}
ngtop
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
