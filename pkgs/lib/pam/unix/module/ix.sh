{% extends '//lib/pam/ix.sh' %}

{% block lib_deps %}
lib/dlfcn
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv lib old
mkdir lib
mv old/security/pam_unix.* lib/libpam_unix.a
rm -rf bin old include etc
{% endblock %}
