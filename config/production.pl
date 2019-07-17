{
  secrets => [$ENV{MOJO_SECRET}],
  DBI => [
    "dbi:mysql:database=app_production;host=$ENV{DATABASE_HOST};port=$ENV{DATABASE_PORT}",
    $ENV{DATABASE_USER},
    $ENV{DATABASE_PASSWORD}
  ]
}