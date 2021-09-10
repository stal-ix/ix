def package(mix):
    deps = [
        'boot/stage/6/clang',
    ]

    return {
        'build': {
            'script': mix.files.build_py,
            'depends': deps,
        },
        'runtime': {
            'depends': deps + [
                'boot/stage/2/which',
                'boot/stage/4/sed',
                'boot/stage/4/gawk',
                'boot/stage/4/grep',
                'boot/stage/4/coreutils',
                'boot/stage/5/dash',
                'boot/stage/5/diffutils',
                'boot/stage/5/findutils',
                'env/bootstrap',
            ],
        },
    }
