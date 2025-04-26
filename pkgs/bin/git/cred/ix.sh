{% extends '//bin/git/unwrap/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/secret
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block unpack %}
{{super()}}
cd contrib/credential/libsecret
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp git-credential-libsecret ${out}/bin/
{% endblock %}
