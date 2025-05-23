{% extends '//bin/greetd/t/ix.sh' %}

{#
   Compiling agreety v0.10.3 (/ix/build/0uwPpZXYTkDszqjZcZUlG7/src/agreety)
error[E0432]: unresolved import `nix::sys::utsname`
   --> agreety/src/main.rs:9:15
    |
9   | use nix::sys::utsname::uname;
    |               ^^^^^^^ could not find `utsname` in `sys`
    |
note: found an item that was configured out
   --> /ix/build/0uwPpZXYTkDszqjZcZUlG7/src/vendored/nix/src/sys/mod.rs:198:13
    |
198 |     pub mod utsname;
    |             ^^^^^^^
note: the item is gated behind the `feature` feature
   --> /ix/build/0uwPpZXYTkDszqjZcZUlG7/src/vendored/nix/src/sys/mod.rs:197:8
    |
197 |     #![feature = "feature"]
    |        ^^^^^^^
#}

{% block unpack %}
{{super()}}
cd agreety
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/agreety ${out}/bin/
{% endblock %}
