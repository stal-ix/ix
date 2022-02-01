{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://mirrors.kernel.org/sourceware/lvm2/LVM2.2.03.14.tgz
sha:4a63bc8a084a8ae3c7bc5e6530cac264139d218575c64416c8b99e3fe039a05c
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block configure_flags %}
--enable-pkgconfig
--enable-static_link
{% endblock %}

{% block make_target %}
device-mapper
{% endblock %}

{% block make_install_target %}
install_device-mapper
{% endblock %}

{% block setup_tools %}
cat << EOF > readelf
#!$(which sh)
EOF

CL=$(which clang)

cat << EOF > clang
#!$(which python3)
import os
import sys
import subprocess

if '.so' in str(sys.argv):
    for x in sys.argv:
        if '.so' in x:
            if '/' in x:
                try:
                    os.makedirs(os.path.dirname(x))
                except OSError:
                    pass

            open(x, 'w')

    sys.exit(0)

subprocess.check_call(["${CL}"] + sys.argv[1:])
EOF

chmod +x clang readelf
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
