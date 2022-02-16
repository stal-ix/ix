{% extends '//mix/std/mix.sh' %}

{% block fetch %}
https://github.com/archlinux/svntogit-community/archive/9c1088de663548eb993f74bf7ef2a2d4e169bafc.zip
sha:e2687a90892fd5ac16a6a0e24d0d1f00068d0e844c223525fcb824856be586ea
{% endblock %}

{% block install %}
mkdir -p ${out}/etc/acpi

cp trunk/anything trunk/*.sh ${out}/etc/acpi

cd ${out}/etc/acpi

for x in *.sh; do
    chmod +x ${x}
    sed -e 's|/bin/bash|/bin/sh|' -i ${x}
done
{% endblock %}
