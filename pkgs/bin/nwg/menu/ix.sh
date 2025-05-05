{% extends '//bin/nwg/t/ix.sh' %}

{% block pkg_name %}
nwg-menu
{% endblock %}

{% block version %}
0.1.8
{% endblock %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-menu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
05936339d78893c23cd6a626f93e2ace86c50845c7a5110c7e96d6d846343b2d
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-menu ${out}/bin/
{% endblock %}
