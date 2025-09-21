{% extends '//die/go/build.sh' %}

{% block pkg_name %}
duf
{% endblock %}

{% block version %}
0.9.1
{% endblock %}

{% block go_url %}
https://github.com/muesli/duf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0e5abe616e361bd84358f0b3af0040bfd185deb17f34eeac6e358b5b4673e72b
{% endblock %}

{% block go_bins %}
duf
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
