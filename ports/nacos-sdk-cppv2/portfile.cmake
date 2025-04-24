vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
	URL git@github.com:KinderLi/nacos-sdk-cppv2.git
	REF e1428119861c268739a9bdf0988e776c68904bd1 # v2.1.2
)

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH share/nacos-sdk-cppv2)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/lib/cmake"
    "${CURRENT_PACKAGES_DIR}/lib/cmake"
)

file(INSTALL ${SOURCE_PATH}/PROJ_VERSION DESTINATION ${CURRENT_PACKAGES_DIR}/share/nacos-sdk-cppv2 RENAME copyright)
