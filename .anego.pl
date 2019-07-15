die "MOJO_MODE SET SHIRO BOKE" unless $ENV{MOJO_MODE};
my $env = $ENV{MOJO_MODE};
my $config = do "./config/${env}.conf";

+{
    connect_info => [@{$config->{DBI}}],
    schema_class => "MojoExample::DB::Schema"
};