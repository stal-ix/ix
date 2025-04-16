{% extends '//die/go/build.sh' %}

{% block pkg_name %}
goawk
{% endblock %}

{% block version %}
1.29.1
{% endblock %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a440f669087a76f4b0bafe597f31fa9829af3ecd8fc16ad995ae95e548321f08
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
