{% extends '//die/go/build.sh' %}

{% block pkg_name %}
logalize
{% endblock %}

{% block version %}
0.4.7
{% endblock %}

{% block go_url %}
https://github.com/deponian/logalize/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3355a85f073be3a3cb7b5028515f312381af84ecfc8b32d52efc733281c9e1fc
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp logalize ${out}/bin/
{% endblock %}
