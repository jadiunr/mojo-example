package MojoExample::DB;
use Mojo::Base 'Aniki';

__PACKAGE__->setup(
    schema => 'MojoExample::DB::Schema',
);

1;