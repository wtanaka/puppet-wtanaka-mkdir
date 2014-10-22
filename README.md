puppet-wtanaka-mkdir
====================

This module defines a custom function `all_parents()` which you can
use to create a directory and all of its ancestors simultaneously.

Example
-------

This example creates a symbolic link from `/some/path/to/a/file`
pointing at `/vagrant`

    $path = '/some/path/to/a/file'

    $path_parents = all_parents($path)

    file { $path_parents:
      ensure => 'directory',
      mode   => 775,
    }

    file { $path:
      ensure  => 'link',
      target  => '/vagrant',
      require => File[ $path_parents ],
    }

For the latest information, visit the
[project homepage](http://wtanaka.com/puppet-wtanaka-mkdir)
