{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/dl(dl_for=bld/java/8/libs,dl_lib=zip)
lib/dl(dl_for=bld/java/8/libs,dl_lib=nio)
lib/dl(dl_for=bld/java/8/libs,dl_lib=net)
lib/dl(dl_for=bld/java/8/libs,dl_lib=jvm)
lib/dl(dl_for=bld/java/8/libs,dl_lib=java)
lib/dl(dl_for=bld/java/8/libs,dl_lib=jsig)
lib/dl(dl_for=bld/java/8/libs,dl_lib=verify)
{% endblock %}

{% block bld_tool %}
bld/wrap/cc/plugins/unreg(bins=java)
{{super()}}
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export JAVA_HOME=${out}
export JAVA=${out}/bin/java
export JAVACMD=${out}/bin/java
{% endblock %}

{% block cpp_defines %}
{{super()}}
signal=jdk_signal
sigset=jdk_sigset
sigaction=jdk_sigaction
{% endblock %}
