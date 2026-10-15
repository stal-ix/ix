{% extends '//die/gen.sh' %}

{% block install %}
sdk=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk

cd ${out}

ln -s ${sdk}/System System
mkdir -p usr/lib
ln -s ${sdk}/usr/include usr/include

for x in libSystem.B.tbd libSystem.tbd libc.tbd libdl.tbd libm.tbd libpthread.tbd libobjc.A.tbd libobjc.tbd libresolv.tbd libutil.tbd; do
    ln -s ${sdk}/usr/lib/${x} usr/lib/${x}
done
{% endblock %}

{% block chmod_ro %}
:
{% endblock %}

{% block fix_mtime %}
:
{% endblock %}

{% block env %}
export MACOSX_DEPLOYMENT_TARGET={{sdk_target or '11.0'}}
export OSX_SDK="${out}"
export CPPFLAGS="--sysroot \${OSX_SDK} -isystem\${OSX_SDK}/usr/include -iframework\${OSX_SDK}/System/Library/Frameworks \${CPPFLAGS}"
export LDFLAGS="--sysroot \${OSX_SDK} -L\${OSX_SDK}/usr/lib -F\${OSX_SDK}/System/Library/Frameworks -Wl,-platform_version -Wl,macos -Wl,\${MACOSX_DEPLOYMENT_TARGET} -Wl,\${MACOSX_DEPLOYMENT_TARGET} -lc \${LDFLAGS}"
{% endblock %}
