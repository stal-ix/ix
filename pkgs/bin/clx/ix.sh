{% extends '//die/go/build.sh' %}

{% block pkg_name %}
circumflex
{% endblock %}

{% block version %}
3.8
{% endblock %}

{% block go_url %}
https://github.com/bensadeh/circumflex/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
8dfe90e029c9a656e43a2bd7d120c0e17d6dc4fe3af3c5014969fa4cf2e14b5f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp clx ${out}/bin/
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
