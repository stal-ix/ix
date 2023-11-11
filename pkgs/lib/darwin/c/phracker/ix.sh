{% extends '//die/std/ix.sh' %}

{% block lib_deps %}
lib/build
{% endblock %}

{% block fetch %}
https://github.com/phracker/MacOSX-SDKs/releases/download/11.3/MacOSX11.3.sdk.tar.xz
sha:cd4f08a75577145b8f05245a2975f7c81401d75e9535dcffbb879ee1deefcbf4
{% endblock %}

{% block step_unpack %}
cd ${out}
extract 1 ${src}/Mac*
{% endblock %}

{% block postinstall %}
echo 'nothing to fix'
{% endblock %}

{% block chmod_ro %}
{% endblock %}

{% block fix_mtime %}
{% endblock %}

{% block env %}
export MACOSX_DEPLOYMENT_TARGET=11.0
export OSX_SDK="${out}"
export CPPFLAGS="--sysroot \${OSX_SDK} -isystem\${OSX_SDK}/usr/include -F\${OSX_SDK} \${CPPFLAGS}"
export LDFLAGS="--sysroot \${OSX_SDK} -L\${OSX_SDK}/usr/lib -F\${OSX_SDK} -Wl,-platform_version -Wl,macos -Wl,\${MACOSX_DEPLOYMENT_TARGET} -Wl,\${MACOSX_DEPLOYMENT_TARGET} -lc \${LDFLAGS}"
{% endblock %}
