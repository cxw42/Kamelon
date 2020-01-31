use strict;

print <<__EOF;

*********************************************************
This package contains a number of scripts that use Wx.
If you want to use these scripts, please install it.
*********************************************************

__EOF

my $alt = $ENV{PERL_ALT_INSTALL} || '';

my $pmfile = #'Kamelon/lib/Syntax/Kamelon.pm';
    'lib/Alt/Syntax/Kamelon/RT129134.pm';

use ExtUtils::MakeMaker;
WriteMakefile(
   DESTDIR           => ($alt ? $alt eq 'OVERWRITE' ? '' : $alt : 'no-install-alt'),
   NAME              => 'Alt::Syntax::Kamelon::RT129134',
   VERSION           => '0.000001',     # Shouldn't satisfy any dependencies
   LICENSE           => 'gpl_3',
   PREREQ_PM         => {
      'Data::Dumper' => 0,
      'Module::Load::Conditional' => 0,
      'Template' => 2.27,
      'Term::ANSIColor' => 4.00,
      'Test::More' => 1,
      'XML::TokeParser' => 0.05,
      'Time::HiRes' => 0,
   },
   ABSTRACT_FROM     => 'lib/Syntax/Kamelon.pod', # retrieve abstract from module
   (eval { ExtUtils::MakeMaker->VERSION(6.46) } ? (META_MERGE => {
      'meta-spec' => { version => 2 },
          resources => {
              repository => {
                 type => 'git',
		 url  => 'git://github.com/haje61/Kamelon.git',
                 web  => 'https://github.com/haje61/Kamelon',
              },
          },
          no_index => {
              directory => [ qw(bin tools lib/Syntax Kamelon) ],
              namespace => [ qw(Syntax::Kamelon) ],
          },
          release_status => 'testing',
      })
      : ()
    ),
);
