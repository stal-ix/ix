{% extends '//die/go/build.sh' %}

{% block pkg_name %}
logalize
{% endblock %}

{% block version %}
0.4.3
{% endblock %}

{% block go_url %}
https://github.com/deponian/logalize/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
fccc6e0d68e8ca6115e2999a5337834ec9ff9f96377cbcb8c835ec2ad92c8726
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp logalize ${out}/bin/
{% endblock %}
