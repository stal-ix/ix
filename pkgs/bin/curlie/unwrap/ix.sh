{% extends '//die/go/build.sh' %}

{% block version %}
1.8.1
{% endblock %}

{% block go_url %}
https://github.com/rs/curlie/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9e36af1f7f963d06b31ec743c73fb9b592e6a79f9bc29f85e4ad447b615309c5
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp curlie ${out}/bin/
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_compiler %}
bin/go/lang/24
{% endblock %}
