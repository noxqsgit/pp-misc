# --                                                            ; {{{1
#
# File        : modules/mkdir_p/manifests/init.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-09-16
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define mkdir_p (
  $path = $title,
  $log  = on_failure,
  $user = undef,
) {
  $path_sh = shellquote($path)

  exec { "[mkdir_p] ${path}":
    command   => "mkdir -p ${path_sh}",
    unless    => "test -d ${path_sh}",
    logoutput => $log,
    user      => $user,
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
