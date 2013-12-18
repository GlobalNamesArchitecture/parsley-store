parsley-store
=============

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

  parser.parse('Homo sapiens sapiens Linn. 1758', :canonical_only => true)

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Copyright
---------

Authors: [Dmitry Mozzherin][12] 

Copyright (c) 2010-2014 Marine Biological Laboratory. See LICENSE for details.
