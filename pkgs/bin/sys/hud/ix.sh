{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/System64fumo/syshud/archive/734d632ca0665a288d1308f883d974462fa2d349.zip
f129916b4e28145821496c19c00bcd4478ccb5e431e87944dc5d37f1a25481cb
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/evdev
lib/gtk/4/mm
lib/gtk/layer/shell/4
lib/shim/fake/pkg(pkg_name=wireplumber-0.5,pkg_ver=100500)
{% endblock %}

{% block patch %}
sed -e 's|-fno-exceptions||' -i Makefile
>src/wireplumber.cpp
cat << EOF > src/wireplumber.hpp
#pragma once
#include <glibmm/dispatcher.h>
class syshud_wireplumber {
public:
    syshud_wireplumber(Glib::Dispatcher*, Glib::Dispatcher*) {
    }

    virtual ~syshud_wireplumber() {
    }

    int volume = 0;
    bool muted = true;
    const char* output_name = "unknown";
    const char* input_name = "unknown";

    void set_volume(const bool& type, const double& value) {
    }
};
EOF
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block cpp_missing %}
unistd.h
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
