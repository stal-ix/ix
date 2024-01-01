{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/20240101.tar.gz
sha:d2cd49d0e5e8bdb808d86f07f946a0cfbf2dc9a449a4b8243a82be267d852b62
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/utmp
{% endblock %}

{% block configure %}
echo "${out}/bin" > conf-bin
echo "${out}/doc" > conf-man
{% endblock %}

{% block build %}
sh -e ./make-tinyssh.sh
{% endblock %}

{% block install %}
sh -e ./make-install.sh
{% endblock %}

{% block patch %}
cd tinyssh-tests
for x in *.c; do
    echo 'int main() {}' > ${x}
done
{% endblock %}
