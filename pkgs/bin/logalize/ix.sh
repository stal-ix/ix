{% extends '//die/go/build.sh' %}

{% block pkg_name %}
logalize
{% endblock %}

{% block version %}
0.4.6
{% endblock %}

{% block go_url %}
https://github.com/deponian/logalize/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3f40a349db90a1965de7f7ed75c8dfdbc2b7794070bba0d7385ee1dab2f6aafd
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp logalize ${out}/bin/
{% endblock %}
