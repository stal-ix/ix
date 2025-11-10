{% extends '//die/go/build.sh' %}

{% block pkg_name %}
ipget
{% endblock %}

{% block version %}
0.12.1
{% endblock %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
8444a7f98f04d6d51e717acde375bbc21a039409a723ed03ddcc3998512981ee
{% endblock %}

{% block go_bins %}
ipget
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
