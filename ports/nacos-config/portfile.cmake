vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
	URL git@github.com:KinderLi/nacos-config.git
	REF 59f56ab3a8cce724332654b2ae3c5bf17c779976 # v1.4.17
)

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH share/nacos-config)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/lib/cmake"
    "${CURRENT_PACKAGES_DIR}/lib/cmake"
)

file(INSTALL ${SOURCE_PATH}/PROJ_VERSION DESTINATION ${CURRENT_PACKAGES_DIR}/share/nacos-config RENAME copyright)
