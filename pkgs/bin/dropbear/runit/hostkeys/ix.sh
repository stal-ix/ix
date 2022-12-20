{% extends '//die/proxy.sh' %}

{% block bld_tool %}
bin/openssl
bin/dropbear/runit/keygen
{% endblock %}

{% block install %}
openssl enc -aes-256-ctr -pass pass:"{{seed}}" -nosalt < /dev/zero | head -n 1000000 > entropy
mkdir ${out}/bin

cp entropy ${out}/bin/
{% endblock %}
