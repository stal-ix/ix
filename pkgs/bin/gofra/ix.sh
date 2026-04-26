{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block version %}
a83a491823fa3feed677bfa6ed0b556288c72c82
{% endblock %}

{% block go_url %}
https://github.com/pg83/gofra/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
59abe51913ee2b6aa55a3b40ccbd49020ff144189f1abedf83e6fcc55ec7478b
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin
{% endblock %}
