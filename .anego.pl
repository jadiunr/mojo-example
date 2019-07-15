die 'MOJO_MODE env is undefined.' unless $ENV{MOJO_MODE};
my $config = do "./config/$ENV{MOJO_MODE}.pl";

+{
    connect_info => [@{$config->{DBI}}],
    schema_class => "MojoExample::DB::Schema"
};