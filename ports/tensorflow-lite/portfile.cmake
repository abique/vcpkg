vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO tensorflow/tensorflow
    REF v2.10.0
    SHA512 bf8a6f16393499c227fc70f27bcfb6d44ada53325aee2b217599309940f60db8ee00dd90e3d82b87d9c309f5621c404edab55e97ab8bfa09e4fc67859b9e3967
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/tensorflow/lite
    PREFER_NINJA
    OPTIONS
        -DTFLITE_ENABLE_RUY=OFF
        -DTFLITE_ENABLE_NNAPI=OFF
)
vcpkg_install_cmake()
vcpkg_copy_pdbs()
vcpkg_fixup_cmake_targets(CONFIG_PATH share/unofficial-${PORT} TARGET_PATH share/unofficial-${PORT})

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
