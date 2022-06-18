project('io.github.vtorbr.disk_space', 'vala', 'c')

executable(
    meson.project_name(),
    'source' / 'Application.vala',
    dependencies: [
        dependency('gtk+-3.0')
    ],
    install: true
)

install_data(
    'data' / 'disk-space.desktop',
    install_dir: get_option('datadir') / 'applications',
    rename: meson.project_name() + '.desktop'
)

install_data(
    'data' / 'disk-space.metainfo.xml',
    install_dir: get_option('datadir') / 'metainfo',
    rename: meson.project_name() + '.metainfo.xml'
)

