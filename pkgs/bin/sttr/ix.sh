{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sttr
{% endblock %}

{% block version %}
0.2.30
{% endblock %}

{% block go_url %}
https://github.com/abhimanyu003/sttr/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
32530c4b21c1bc9a3ade7ad5ce2eafd33723711c76dc059ebd93fa8a3bf18b4f
{% endblock %}

{% block go_bins %}
sttr
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
