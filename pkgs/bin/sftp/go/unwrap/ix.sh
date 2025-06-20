{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sftpgo
{% endblock %}

{% block version %}
2.6.0
{% endblock %}

{% block go_url %}
https://github.com/drakkan/sftpgo/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ccfb1525ace51b0b122b2dedbcba0b3dc05ecddd381eee0435fb80140774d863
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_bins %}
sftpgo
{% endblock %}
