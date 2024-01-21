{% extends '//bin/greetd/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/pam
lib/pam/unix
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/greetd ${out}/bin/
{% endblock %}

{% block unpack %}
{{super()}}
cd greetd
{% endblock %}

{% block patch %}
find . -type f -name '*.rs' | while read l; do
    sed -e 's|/run/greet|/var/run/greetd1/greet|g' -i ${l}
done
sed -e 's|.*pam.*acct_mgmt.*||' -i src/session/worker.rs
{% endblock %}
