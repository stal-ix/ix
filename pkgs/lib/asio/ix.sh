{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
asio
{% endblock %}

{% block version %}
1.38.2
{% endblock %}

{% block fetch %}
https://github.com/chriskohlhoff/asio/archive/refs/tags/asio-1-32-0.tar.gz
f1b94b80eeb00bb63a3c8cef5047d4e409df4d8a3fe502305976965827d95672
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=asio,pkg_ver={{self.version().strip()}})
{% endblock %}

{% block unpack %}
{{super()}}
cd asio
{% endblock %}

{% block install %}
cp -R include ${out}/
{% endblock %}
