{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/DominicBreuker/pspy/archive/refs/tags/v1.2.1.tar.gz
{% endblock %}

{% block go_sha %}
2aa3c439fdebb4809bfa57eeea558b1bcc23384bf205828f07b33c1b8f0cefbf
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp pspy ${out}/bin/
{% endblock %}

