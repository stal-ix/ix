{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://git.sr.ht/~kennylevinsen/greetd/archive/0.9.0.tar.gz
{% endblock %}

{% block cargo_sha %}
1bc314b525f56d8ebc62d9e9d25c95876adf3f65390db33b551e5b2482c464a7
{% endblock %}

{% block bld_libs %}
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
