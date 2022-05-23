{% extends '//bin/acpid/2/ix.sh' %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|/var/run/|/var/run/acpid2/|' -i "${l}"
done

{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/acpid bin/
rm -r old
{% endblock %}
