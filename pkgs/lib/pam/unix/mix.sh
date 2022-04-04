{% extends '//lib/pam/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv lib old
mkdir lib
mv old/security/pam_unix.a lib/libpam_unix.a
rm -r bin old include etc
{% endblock %}
