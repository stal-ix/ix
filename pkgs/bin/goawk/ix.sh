{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.24.0.tar.gz
{% endblock %}

{% block go_sha %}
160c318c1dbca10fcfdb460dd97a362f8f5ac14668fa733da31f54ce7698d9a0
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
