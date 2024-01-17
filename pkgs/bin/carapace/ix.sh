{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/rsteube/carapace-bin/archive/refs/tags/v0.29.1.tar.gz
{% endblock %}

{% block go_sha %}
c4cd874e447b15e9aa3418ff44b35743237afd7ff0818a57fbfcd3fef06e7784
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/carapace
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp carapace ${out}/bin/
{% endblock %}
