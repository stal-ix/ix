{% extends '//bin/nwg/t/ix.sh' %}

{% block version %}
0.1.5
{% endblock %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-menu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7e52410806370e56cef2783599e1daaa82a61c7b0421101d1505727ac14e9e06
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-menu ${out}/bin/
{% endblock %}
