use Test::More ;

use lib 'lib';
use Net::Domain::Regex;

my $c = Net::Domain::Regex->new;

ok( $c , 'Object Instantiated' );

my @res = $c->match( 'snickers.org' );

ok( $res[0]{tld} eq 'org' => 'snickers.org - TLD' );
ok( $res[0]{domain} eq 'snickers' => 'snickers.org - Domain' );
ok( $res[0]{hostname} eq '' => 'snickers.org - Hostname' );

my $hostname = 'ftp.daemon.co.uk';
@res = $c->match( $hostname );

ok( $res[0]{tld} eq 'co.uk' => 'ftp.daemon.co.uk - TLD' );
ok( $res[0]{domain} eq 'daemon' => 'ftp.daemon.co.uk - Domain' );
ok( $res[0]{hostname} eq 'ftp' => 'ftp.daemon.co.uk - Hostname' );

$hostname = 'ftp.daemon.co.uk.foobar';

@res = $c->match( $hostname );

ok( scalar @res == 0 => "$hostname did not parse" );

done_testing();

