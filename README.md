parsley-store
=============

[![Gem Version][1]][2]
[![Continuous Integration Status][3]][4]
[![Coverage Status][5]][6]
[![CodePolice][7]][8]
[![Dependency Status][9]][10]

This gem allows to dramatically increase speed of 'parsing' scientific names. 
It stores parsed strings in Redis database and does not repeat work already done

Installation
------------
  
  Make sure you have Redis installed on your localhost

  gem install parsley-store

Usage
-----

    parser = ParsleyStore.new
    parser.parse('Homo sapiens sapiens Linn. 1758')
    parser.parse('Homo sapiens sapiens Linn. 1758')

The second parse must be much faster!

To get only canonical name:

    parser.parse('Homo sapiens sapiens Linn. 1758', canonical_only: true)

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Copyright
---------

Authors: [Dmitry Mozzherin][11] 

Copyright (c) 2010-2014 Marine Biological Laboratory. See LICENSE for details.

[1]: https://badge.fury.io/rb/parsley-store.png
[2]: http://badge.fury.io/rb/parsley-store
[3]: https://secure.travis-ci.org/GlobalNamesArchitecture/parsley-store.png
[4]: http://travis-ci.org/GlobalNamesArchitecture/parsley-store
[5]: https://coveralls.io/repos/GlobalNamesArchitecture/parsley-store/badge.png?branch=master
[6]: https://coveralls.io/r/GlobalNamesArchitecture/parsley-store?branch=master
[7]: https://codeclimate.com/github/GlobalNamesArchitecture/parsley-store.png
[8]: https://codeclimate.com/github/GlobalNamesArchitecture/parsley-store
[9]: https://gemnasium.com/GlobalNamesArchitecture/parsley-store.png
[10]: https://gemnasium.com/GlobalNamesArchitecture/parsley-store
[11]: https://github.com/dimus
