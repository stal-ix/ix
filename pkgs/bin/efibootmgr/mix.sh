{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/rhboot/efibootmgr/archive/refs/tags/17.tar.gz
sha:22a95ebe0d5c9fb2915b3a100450f8f37484d1dbb8b296f55b343cc84f10397d
{% endblock %}

{% block bld_libs %}
lib/c
lib/popt
lib/linux
lib/efivar
{% endblock %}

{% block bld_tool %}
bin/pkg-config
{% endblock %}

{% block make_flags %}
EFIDIR=/boot/efi
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|extern int efi_set_verbose|extern void efi_set_verbose|' -i ${l}
done
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin bin
{% endblock %}
