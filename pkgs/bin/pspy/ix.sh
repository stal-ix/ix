{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/DominicBreuker/pspy/archive/refs/tags/v1.2.1.tar.gz
{% endblock %}

{% block go_sha %}
ef501aa19e17c125c95f84e442f235e29e78671615aa559fa7de8903511f9b38
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp pspy ${out}/bin/
{% endblock %}
