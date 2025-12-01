{% extends '//bld/java/boot/oracle/t/ix.sh' %}

{% block bld_tool %}
bld/java/boot/free
bld/java/boot/jamvm/jdk
{% endblock %}

{% block build %}
mkdir -p build/linux-amd64/langtools/build/genstubs/java/io
base64 -d << EOF > build/linux-amd64/langtools/build/genstubs/java/io/File.java
{% include 'File.java/base64' %}
EOF
base64 -d << EOF > build/linux-amd64/langtools/build/genstubs/java/io/FileSystem.java
{% include 'FileSystem.java/base64' %}
EOF
{{super()}}
{% endblock %}

{% block make_flags %}
UNIXCOMMAND_PATH=" "
USRBIN_PATH=" "
UTILS_COMMAND_PATH=" "
UTILS_USR_BIN_PATH=" "
REQUIRED_BOOT_VER=1.5.0
USER=root
LOGNAME=root
ALT_BOOTDIR=${JAVA_HOME}
BOOT_JAVA_HOME=${JAVA_HOME}
{% endblock %}

{% block make_target %}
langtools
{% endblock %}

{% block install %}
cp -R build/linux-amd64/langtools/dist/bootstrap ${out}/
cp -R build/linux-amd64/langtools/dist/lib ${out}/lib/
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export JDK_BOOT_PATH=${out}
{% endblock %}
