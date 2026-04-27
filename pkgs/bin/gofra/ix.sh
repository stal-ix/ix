{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block version %}
72e8fe8408f2df1b461c4c6a7de2e28d8b5de99d
{% endblock %}

{% block go_url %}
https://github.com/pg83/gofra/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a9bfd8c4128c756fe0f41c4e7f34778755163269ec03c99eb7d34294db65375e
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin
{% endblock %}
