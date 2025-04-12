{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gopass
{% endblock %}

{% block version %}
1.14.3
{% endblock %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e82a085324332eac34e51c9e1eb115c4f8728b3144f137900935f5f72991c73a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gopass ${out}/bin/
{% endblock %}
