# Public: Set the hot corner actions
#
# Parameters
#
#   bottom_left =>
#     A string or hash containing the action and/or modifier for the bottom left corner
#
#   bottom_right =>
#     A string or hash containing the action and/or modifier for the bottom right corner
#
#   top_right =>
#     A string or hash containing the action and/or modifier for the top right corner
#
#   top_left =>
#     A string or hash containing the action and/or modifier for the top left corner
#

class osx::dock::hot_corners(
  $bottom_left = undef,
  $bottom_right = undef,
  $top_right = undef,
  $top_left = undef
) {
  if $bottom_left != undef {
    if is_string($bottom_left) {
      $_bl_params = { 'action' => $bottom_left }
    } else {
      $_bl_params = $bottom_left
    }
    ensure_resource('osx::dock::hot_corner', 'bottom left', $_bl_params)
  }

  if $bottom_right != undef {
    if is_string($bottom_right) {
      $_br_params = { 'action' => $bottom_right }
    } else {
      $_br_params = $bottom_right
    }
    ensure_resource('osx::dock::hot_corner', 'bottom right', $_br_params)
  }

  if $top_right != undef {
    if is_string($top_right) {
      $_tr_params = { 'action' => $top_right }
    } else {
      $_tr_params = $top_right
    }
    ensure_resource('osx::dock::hot_corner', 'top right', $_tr_params)
  }

  if $top_left != undef {
    if is_string($top_left) {
      $_tl_params = { 'action' => $top_left }
    } else {
      $_tl_params = $top_left
    }
    ensure_resource('osx::dock::hot_corner', 'top left', $_tl_params)
  }
}
