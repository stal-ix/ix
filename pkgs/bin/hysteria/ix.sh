{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.2.3.tar.gz
{% endblock %}

{% block go_sha %}
e8df19d1e75928fa0069f17c055cd7a1e62d982bdd7ac7012434afd70c5ef4d6
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp app ${out}/bin/
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}
