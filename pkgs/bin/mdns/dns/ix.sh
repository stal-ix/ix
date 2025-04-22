{% extends '//die/go/build.sh' %}

{% block pkg_name %}
mdns2dns
{% endblock %}

{% block version %}
1
{% endblock %}

{% block go_url %}
https://github.com/pg83/mdns2dns/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3c1007d1f94deb6703914b23690b9ac5f6ee45e30306c7c6b392a3cefa46be28
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mdns2dns ${out}/bin/
{% endblock %}
