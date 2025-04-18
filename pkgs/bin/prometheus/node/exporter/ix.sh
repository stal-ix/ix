{% extends '//die/go/build.sh' %}

{% block pkg_name %}
node_exporter
{% endblock %}

{% block version %}
1.9.1
{% endblock %}

{% block go_url %}
https://github.com/prometheus/node_exporter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
243349e243ad0af465cdef883bca21a4c0532392469cd21a43f47aa585ccd42e
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp node_exporter ${out}/bin/
{% endblock %}


{% block go_tool %}
bin/go/lang/24
{% endblock %}
