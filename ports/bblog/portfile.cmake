vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL git@github.com:KinderLi/bblog.git # v4.0.2
  REF 91d5517df1a060d0efbd8e0b234b370ca2da6a33
)

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH share/bblog)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/lib/cmake"
    "${CURRENT_PACKAGES_DIR}/lib/cmake"
)

file(INSTALL ${SOURCE_PATH}/VERSION DESTINATION ${CURRENT_PACKAGES_DIR}/share/bblog RENAME copyright)
