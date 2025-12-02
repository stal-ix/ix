{% extends '//bld/java/boot/oracle/t/ix.sh' %}

{% block bld_tool %}
bld/fake(tool_name=ldd)
bld/fake/binutils
bld/java/boot/free
bld/java/boot/jamvm/jdk
{% endblock %}

{% block patch %}
{{super()}}
cat jdk/make/tools/Makefile \
    | grep -v compile_font_config \
    | grep -v dtdbuilder \
    | grep -v dirdiff \
    | grep -v generatebreakiteratordata \
    | grep -v generate_break_iterator \
    | grep -v javazic \
    | grep -v generatenimbus \
    | grep -v generate_nimbus \
    > _
mv _ jdk/make/tools/Makefile
{% endblock %}

{% block build %}
mkdir -p build/linux-amd64/btjars
>build/linux-amd64/btjars/jarreorder.jar
mkdir -p jre/lib/amd64/server
>jre/lib/amd64/server/libjvm.so
>jre/lib/amd64/server/Xusage.txt
>jre/lib/amd64/libjsig.so
mkdir -p build/linux-amd64/lib/amd64/server
>build/linux-amd64/lib/amd64/server/libjvm.so
>build/linux-amd64/lib/amd64/libjsig.so
{{super()}}
{% endblock %}

{% block make_flags %}
ENABLE_FULL_DEBUG_SYMBOLS=0
UNIXCOMMAND_PATH=" "
USRBIN_PATH=" "
UTILS_COMMAND_PATH=" "
UTILS_USR_BIN_PATH=" "
REQUIRED_BOOT_VER=1.5.0
USER=root
LOGNAME=root
INCLUDE_SA=false
ALT_BOOTDIR=${JAVA_HOME}
BOOT_JAVA_HOME=${JAVA_HOME}
ALT_HOTSPOT_IMPORT_PATH=${PWD}
ALT_JDK_IMPORT_PATH=${PWD}
DEV_ONLY=true
NO_IMAGES=true
{% endblock %}

{% block make_target %}
jdk
{% endblock %}
