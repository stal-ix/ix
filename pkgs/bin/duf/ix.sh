{% extends '//die/go/build.sh' %}

{% block pkg_name %}
duf
{% endblock %}

{% block version %}
0.8.1
{% endblock %}

{% block go_url %}
https://github.com/muesli/duf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
87e574a7c998142ee1e9b1b57062edfba4fe0ee1308def9d386b71e6abc5c119
{% endblock %}

{% block go_bins %}
duf
{% endblock %}
