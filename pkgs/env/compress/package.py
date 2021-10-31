def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
        },
        'runtime': {
            'depends': [
                'tool/pv/package.sh',
                'tool/compress/unzip/package.sh',
                'tool/compress/bsdtar/package.sh',
            ],
        },
    }
