{% extends '//bld/rust/linux/83/ix.sh' %}

{% block fetch %}
https://static.rust-lang.org/dist/rust-1.86.0-x86_64-unknown-linux-musl.tar.gz
sha:2d399a43e1e4a2dea0e16f83cd0a1dd53f7f32250ba25970ea5d9c31a16df611
https://static.rust-lang.org/dist/rust-std-1.86.0-aarch64-unknown-linux-musl.tar.gz
sha:66b5eee481215ba6a86291bc8c537f3d7a9d24e1f82420c27b88011eda20ce32
https://static.rust-lang.org/dist/rust-std-1.86.0-aarch64-apple-darwin.tar.gz
sha:d87b353c07bdd5acbd5b91bf34ceded17abcaae2fe37afab9d0a314f82d7b2b1
https://static.rust-lang.org/dist/rust-std-1.86.0-x86_64-apple-darwin.tar.gz
sha:0a569f068d327acc581f5beebc733a243ea6898665e3ea2cec500d3bf635d53c
https://static.rust-lang.org/dist/rust-std-1.86.0-x86_64-pc-windows-gnullvm.tar.gz
sha:42027d7415ff16ca1a735adb0f6d045505c85262673fc12fb9a048cd839bb455
{% endblock %}
