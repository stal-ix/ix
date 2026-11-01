{% extends '//bld/java/25/t/ix.sh' %}

{# OpenJDK 25 for the target, cross-compiled. bld/java/25, the same sources
   built for the host, is both the boot JDK and the build JDK: jlink, jmod
   and every other tool the build runs come from it, nothing built here
   runs during the build. #}

{% block boot_jdk %}
bld/java/25
{% endblock %}

{# adlc and the other generators hotspot builds and runs #}
{% block host_libs %}
lib/c
lib/c++
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-build-jdk=${JAVA_HOME}
{% if not native %}
# gnu.three names no libc; ix targets musl
--openjdk-target={{target.gnu_arch}}-unknown-linux-musl
BUILD_CC=${HOST_CC}
BUILD_CXX=${HOST_CXX}
{% endif %}
{% endblock %}

{# a runtime JDK registers every native library it ships, not just the
   ones a build needs; left out are jsig (for LD_PRELOAD) and syslookup
   (an empty library, for dlsym into libc) #}
{% block dl_libs %}
attach
dt_socket
extnet
instrument
j2gss
j2pcsc
j2pkcs11
jaas
java
jdwp
jimage
jvm
management
management_agent
management_ext
net
nio
prefs
rmi
sctp
verify
zip
{% if x86_64 %}
jsvml
{% elif aarch64 %}
sleef
{% endif %}
{% endblock %}

{% block dl_onload_libs %}
j2gss
j2pcsc
j2pkcs11
java
management
management_agent
management_ext
net
nio
sctp
{% endblock %}

{# JVMTI agents, found by Agent_OnLoad/Agent_OnUnload like JNI libraries
   by JNI_OnLoad #}
{% block dl_agent_libs %}
instrument
jdwp
{% endblock %}
