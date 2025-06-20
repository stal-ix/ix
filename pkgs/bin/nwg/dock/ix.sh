{% extends '//bin/nwg/t/ix.sh' %}

{% block pkg_name %}
nwg-dock
{% endblock %}

{% block version %}
0.4.3
{% endblock %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-dock/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7fe1ab31d418bb19b21cc32bbb3f7046eda70768b48768d7301be32a813e6858
{% endblock %}

{% block go_bins %}
nwg-dock
{% endblock %}


{% block go_tool %}
bin/go/lang/24
{% endblock %}
