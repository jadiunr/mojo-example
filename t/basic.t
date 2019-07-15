use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('MojoExample::Web');
$t->get_ok('/')->status_is(200)->content_like(qr/ok/i);

done_testing();
